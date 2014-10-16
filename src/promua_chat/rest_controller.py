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
from promua_chat.model import User


class UserController(object):

    _cp_config = {"tools.json_in.on": True}

    @cherrypy.tools.json_out()
    def create(self, **kwargs):
        req = cherrypy.request
        orm_session = req.orm_session
        user = from_collection(req.json, User())
        orm_session.add(user)
        orm_session.commit()
        return to_collection(user, includes="age", excludes=("password", "salt"),
                          sort_keys=True)

    @cherrypy.tools.json_out()
    def show(self, id, **kwargs):
        id = int(id)
        user = api.find_user_by_id(cherrypy.request.orm_session, id)
        if user:
            return to_collection(user, includes="age", excludes=("password", "salt"),
                              sort_keys=True)
        raise HTTPError(404)

    @cherrypy.tools.json_out()
    def update(self, id, **kwargs):
        id = int(id)
        req = cherrypy.request
        orm_session = req.orm_session
        user = api.find_user_by_id(orm_session, id)
        if user:
            user = from_collection(req.json, user)
            orm_session.commit()
            return to_collection(user, includes="age", excludes=("password", "salt"),
                              sort_keys=True)
        raise HTTPError(404)

    def delete(self, id, **kwargs):
        id = int(id)
        req = cherrypy.request
        orm_session = req.orm_session
        if not api.delete_user_by_id(orm_session, id):
            raise HTTPError(404)
        else:
            orm_session.commit()


rest_controller = cherrypy.dispatch.RoutesDispatcher()
rest_controller.mapper.explicit = False
rest_controller.connect("new_user", "/", UserController, action="create",
                        conditions={"method":["POST"]})
rest_controller.connect("show_user", "/{id}", UserController, action="show",
                        conditions={"method":["GET"]})
rest_controller.connect("update_user", "/{id}", UserController, action="update",
                        conditions={"method":["PUT"]})
rest_controller.connect("delete_user", "/{id}", UserController, action="delete",
                        conditions={"method":["DELETE"]})

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
