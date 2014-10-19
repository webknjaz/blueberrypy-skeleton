try:
    import simplejson as json
except ImportError:
    import json

import sys
import traceback

import cherrypy

from cherrypy import HTTPError
from cherrypy.lib import httputil as cphttputil
from blueberrypy.util import from_collection, to_collection

from promua_chat import api
from promua_chat.model import User, Room, Message

import functools
import sqlalchemy

def auth(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        '''
        obj is an object with context of func
        '''
        if not cherrypy.session.get('user_id'):
            raise cherrypy.HTTPError(401)
        return func(*args, **kwargs)
    return wrapper

class AuthController:

    _cp_config = {"tools.json_in.on": True}

    @cherrypy.tools.json_out()
    def login(self, **kwargs):
        req = cherrypy.request
        orm_session = req.orm_session
        params = req.json
        if 'username' in params and 'password' in params:
            user = api.find_user_by_name(orm_session, params['username'])
            if user and user.validate_password(params['password']):
                cherrypy.session['user_id'] = user.id
                return to_collection(user, excludes=("password", "salt"),
                                  sort_keys=True)
            raise HTTPError(401)
        raise HTTPError(400)

    @cherrypy.tools.json_out()
    @auth
    def logout(self, **kwargs):
        try:
            del cherrypy.session['user_id']
        except:
            raise HTTPError(404)


class RoomController:

    _cp_config = {"tools.json_in.on": True}

    @cherrypy.tools.json_out()
    @auth
    def create(self, **kwargs):
        '''
            `room_create`
            [POST] /room/
        '''
        req = cherrypy.request
        orm_session = req.orm_session
        room = from_collection(req.json, Room())
        room.creator_id = cherrypy.session['user_id']
        user = api.find_user_by_id(orm_session, cherrypy.session['user_id'])
        room.members.append(user)
        try:
            orm_session.add(room)
            orm_session.commit()
            return to_collection(room, sort_keys=True)
        except sqlalchemy.exc.IntegrityError:
            raise HTTPError(403)

    @cherrypy.tools.json_out()
    @auth
    def list(self, **kwargs):
        '''
            `room_list`
            [GET] /room/
        '''
        rooms = api.get_all_rooms(cherrypy.request.orm_session)
        if rooms:
            return [to_collection(room, sort_keys=True) for room in rooms]
        raise httperror(404)

    @cherrypy.tools.json_out()
    @auth
    def post_message(self, id, **kwargs):
        '''
            `room_post_message`
            [POST] /room/{id}
        '''
        req = cherrypy.request
        req.json['user_id'] = cherrypy.session['user_id']
        req.json['room_id'] = int(id)
        if 'meta' not in req.json:
            req.json['meta'] = {}
        orm_session = req.orm_session
        msg = from_collection(req.json, Message())
        orm_session.add(msg)
        orm_session.commit()
        resp = to_collection(msg, sort_keys=True)
        #resp['author'] = to_collection(msg.author, sort_keys=True)
        return resp

    @cherrypy.tools.json_out()
    @auth
    def show(self, id:'room id here', **kwargs):
        '''
            `room_list_messages`
            [GET] /room/{id}
        '''

        room_id = int(id)
        room = api.get_room(cherrypy.request.orm_session, id)
        if room:
            msgs = []
            for msg in room.messages:
                author = to_collection(msg.author, excludes=("password", "salt"),
                                        sort_keys=True)
                msg = to_collection(msg, sort_keys=True)
                msg['author'] = author
                msgs.append(msg)
            return msgs
        raise HTTPError(404)

    @cherrypy.tools.json_out()
    @auth
    def join_user(self, **kwargs):
        '''
            `room_join_user`
            [PUT] /room/{id}
        '''

        req = cherrypy.request
        orm_session = req.orm_session
        room = api.get_room(orm_session, req.json['room_id'])
        user = api.find_user_by_id(orm_session, cherrypy.session['user_id'])
        if room:
            room.members.append(user)
            orm_session.merge(room) # add() ?
            orm_session.commit()
            return to_collection(room, sort_keys=True)
        raise HTTPError(400)


class UserController:

    _cp_config = {"tools.json_in.on": True}

    @cherrypy.tools.json_out()
    def create(self, **kwargs):
        '''
        `user_register`
        [POST] /user/
        '''
        req = cherrypy.request
        orm_session = req.orm_session
        user = from_collection(req.json, User())
        orm_session.add(user)
        orm_session.commit()
        return to_collection(user, excludes=("password", "salt"),
                          sort_keys=True)

    @cherrypy.tools.json_out()
    def check(self, name, **kwargs):
        '''
        `user_check`
        [HEAD] /user/{name}
        '''
        user = api.find_user_by_id(cherrypy.request.orm_session,
                                    name)
        return user is not None

    @cherrypy.tools.json_out()
    @auth
    def show(self, **kwargs):
        '''
        `user_show`
        [GET] /user/
        '''
        user = api.find_user_by_id(cherrypy.request.orm_session,
                                    cherrypy.session['user_id'])
        if user:
            return to_collection(user, excludes=("password", "salt"),
                              sort_keys=True)
        raise HTTPError(404)

    @cherrypy.tools.json_out()
    @auth
    def list_own_rooms(self, **kwargs):
        '''
        `user_show_own_rooms`
        [GET] /user/rooms/own
        '''
        user = api.find_user_by_id(cherrypy.request.orm_session,
                                    cherrypy.session['user_id'])
        return [to_collection(room, sort_keys=True) for room in user.own_rooms]

    @cherrypy.tools.json_out()
    @auth
    def list_rooms(self, **kwargs):
        '''
        `user_show_rooms`
        [GET] /user/rooms
        '''
        user = api.find_user_by_id(cherrypy.request.orm_session,
                                    cherrypy.session['user_id'])
        if user.rooms:
            return [to_collection(room, sort_keys=True) for room in user.rooms]
        return []

    @cherrypy.tools.json_out()
    @auth
    def leave_room(self, room_id, **kwargs):
        '''
        `user_leave_room`
        [DELETE] /user/rooms/{room_id}
        '''
        room_id = int(room_id)
        req = cherrypy.request
        orm_session = req.orm_session

        user = api.find_user_by_id(cherrypy.request.orm_session,
                                    cherrypy.session['user_id'])
        try:
            room = api.get_room(orm_session, room_id)

            room.members.remove(user)

            orm_session.add(room)
            orm_session.commit()

            return {"status": "OK", "code": 200}
        except:
            raise HTTPError(404)


# RESTful-like bindings
rest_api = cherrypy.dispatch.RoutesDispatcher()
rest_api.mapper.explicit = False

# register [1]
rest_api.connect("user_register", "/user/", UserController,
                        action="create", conditions={"method":["POST"]})
# user info
rest_api.connect("user_show", "/user/", UserController,
                        action="show", conditions={"method":["GET"]})
# user info
rest_api.connect("user_check", "/user/{name}", UserController,
                        action="check", conditions={"method":["HEAD"]})
# list rooms user joined
rest_api.connect("user_show_rooms", "/user/rooms", UserController,
                        action="list_rooms", conditions={"method":["GET"]})
# list rooms user created
rest_api.connect("user_show_own_rooms", "/user/rooms/own", UserController,
                        action="list_own_rooms", conditions={"method":["GET"]})
# leave room [6]
rest_api.connect("user_leave_room", "/user/rooms/{room_id}", UserController,
                        action="leave_room", conditions={"method":["DELETE"]})

# authenticate user
rest_api.connect("user_login", "/auth/", AuthController,
                        action="login", conditions={"method":["POST"]})
# sign out user
rest_api.connect("user_logout", "/auth/", AuthController,
                        action="logout", conditions={"method":["DELETE"]})

# list rooms [3]
rest_api.connect("room_list", "/room/", RoomController,
                        action="list", conditions={"method":["GET"]})

# join user to room [4]
rest_api.connect("room_join_user", "/room/", RoomController,
                        action="join_user", conditions={"method":["PUT"]})

# create new room [2]
rest_api.connect("room_create", "/room/", RoomController,
                        action="create", conditions={"method":["POST"]})
# write a message in chat [5]
rest_api.connect("room_post_message", "/room/{id}", RoomController,
                        action="post_message", conditions={"method":["POST"]})
rest_api.connect("room_list_messages", "/room/{id}", RoomController,
                        action="show", conditions={"method":["GET"]})

# Error handlers

def generic_error_handler(status, message, traceback, version):
    """error_page.default"""
    
    response = cherrypy.response
    response.headers['Content-Type'] = "application/json"
    response.headers.pop('Content-Length', None)

    code, reason, _ = cphttputil.valid_status(status)
    result = {"code": code, "reason": reason, "message": message}
    if hasattr(cherrypy.request, "params"):
        params = cherrypy.request.params
        if "debug" in params and params["debug"]:
            result["traceback"] = traceback
    return json.dumps(result)

def unexpected_error_handler():
    """request.error_response"""

    (typ, value, tb) = sys.exc_info()
    if typ:
        debug = False
        if hasattr(cherrypy.request, "params"):
            params = cherrypy.request.params
            debug = "debug" in params and params["debug"]

        response = cherrypy.response
        response.headers['Content-Type'] = "application/json"
        response.headers.pop('Content-Length', None)
        content = {}

        if isinstance(typ, HTTPError):
            cherrypy._cperror.clean_headers(value.code)
            response.status = value.status
            content = {"code": value.code, "reason": value.reason, "message": value._message}
        elif isinstance(typ, (TypeError, ValueError, KeyError)):
            cherrypy._cperror.clean_headers(400)
            response.status = 400
            reason, default_message = cphttputil.response_codes[400]
            content = {"code": 400, "reason": reason, "message": value.message or default_message}

        if cherrypy.serving.request.show_tracebacks or debug:
            tb = traceback.format_exc()
            content["traceback"] = tb
        response.body = json.dumps(content)
