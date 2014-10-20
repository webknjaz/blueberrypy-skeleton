// https://slack.com/ parody

import 'dart:html';
//import 'dart:io';
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/application_factory_static.dart';

import 'package:logging/logging.dart' show Logger, Level, LogRecord;
import 'dartchat_generated_type_factory_maps.dart' show setStaticReflectorAsDefault;
import 'dartchat_static_expressions.dart' as generated_static_expressions;
import 'dartchat_static_metadata.dart' as generated_static_metadata;
import 'dartchat_static_type_to_uri_mapper.dart' as generated_static_type_to_uri_mapper;

const List<String> CSS_URLs = const [
                                     'https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css',
                                     'packages/angular/css/angular.css',
                                     'dartchat.css'
                                     ];

@Injectable()
class $roomsService {
  final API _api;
  List rooms;
  
  $roomsService(API this._api) {
    refresh();
  }
  
  refresh() {
    _api.list_rooms().then((HttpResponse _) {
      rooms = _.data;
    });
  }
}

@Injectable()
class $joinedRoomsService {
  final API _api;
  final User _user;
  final Room _room;
  List rooms;
  
  $joinedRoomsService(API this._api, User this._user, Room this._room) {
    refresh();
  }
  

  refresh() {
    _api.list_joined_rooms()
      .then((HttpResponse _) {
        rooms = _.data;
        if (rooms.length > 0 && _room.id == null) {
          _room.load(rooms[0]);
        }
      }).catchError((_){
      });
  }
}

@Injectable()
class User {
  final Logger log = new Logger('User');
  String username = '';
  String displayname = '';
  String password = '';
  bool isAuthorized = false;
  bool exists = true;
  Storage _localStorage = window.localStorage;
  
  User() {
    try { // restore user if he's been authorized
      username = _localStorage['username'];
      isAuthorized = _localStorage['isAuthorized'] == 'true';
      displayname = _localStorage['username'];
      exists = _localStorage['exists'] == 'true';
    } catch(_){};
    log.info('User created');
  }
}


@Injectable()
class Room {
  final Logger log = new Logger('Room');
  
  API api;
  
  int id = null;
  String name = '';
  int creator_id;
  List messages = [];
  
  Room(this.api) {
    log.info('Room instance created');
  }
  
  load(var activeRoom) {
    api.list_messages(activeRoom['id'])
      .then((HttpResponse _){
        id = activeRoom['id'];
        name = activeRoom['name'];
        creator_id = activeRoom['creator_id'];
        messages = _.data;
      }).catchError((_){});
  }
  
  toString() => "$id: $name by $creator_id; messages: ${messages.length}";
}


@Injectable()
class API {
  final Http _http;
  final User _user;
  final Logger log = new Logger('API');
  HttpInterceptors _interceptors;
  
  String _endpoint(String _) => "/api/$_/";
  
  API(this._http, this._user, this._interceptors) {
    log.info('API instance initialized');

    var intercept = new HttpInterceptor();
    intercept.responseError = (dynamic _) {
      log.info('In interceptor');
      log.info('checking auth');
      //log.info(_);
      if (_.status == 401) {
          this._user.isAuthorized = false;
	        log.info('Unauthorize user');
    	  //throw new Exception('User session expired');
      }
      return new Future.error(_); //<-- return a Future.error
    };
    _interceptors.add(intercept);

    log.info('Interceptor configured');
  }

  login(String username, String password) {
    return _http.post( _endpoint('auth'),
                      {
                        'username':username,
                        'password':password
                      }
          );
  }
  
  logout() {
    return _http.delete( _endpoint('auth'));
  }
  
  checkuser(String username) {
    return _http.head( _endpoint('user') + username);
  }
  
  register(String username, String password, String displayname) {
    return _http.post( _endpoint('user'),
                      {
                        'username':username,
                        'password':password,
                        'displayname':displayname
                      }
          );
  }
  
  list_joined_rooms() {
    return _http.get( _endpoint('user') + 'rooms' );
  }
  
  list_own_rooms() {
    return _http.get( _endpoint('user') + 'rooms/own' );
  }
  
  leave_room(int room_id) {
    return _http.delete( _endpoint('user') + "rooms/$room_id" );
  }

  create_room(String roomname) {
    return _http.post( _endpoint('room'),
                      {
                        'name':roomname,
                      }
          );
  }
  
  list_rooms() {
    return _http.get( _endpoint('room') );
  }
  

  post_message(int room_id, String text, [meta = const{}]) {
    return _http.post( _endpoint('room') + room_id.toString(),
                      {
                        'text':text,
                        'meta':meta
                      }
          );
  }

  list_messages(int room_id) {
    return _http.get( _endpoint('room') +  room_id.toString() );
  }
  
  enter_room(int room_id) {
    return _http.put( _endpoint('room'), {'room_id':room_id} );
  }
  
}



@Component(
    selector: 'login',
    templateUrl: 'login.html',
    cssUrl: CSS_URLs,
    useNgBaseCss: true)
class LoginView {
  final Logger log = new Logger('LoginView');
  Storage _localStorage = window.localStorage;
  @NgTwoWay('user')
  User user;
  Room _room;
  API api;
  
  LoginView(User this.user, API this.api, Room this._room) {
    log.info('Login layout init');
    log.info(user.username);
    log.info(user.isAuthorized);
    log.info(user);
  }

  void reglogin() {
    _room.id = null;
    _room.name = '';
    _room.messages = [];
    log.info('reglogin clicked');
    if (user.exists) {
      api
        .login(user.username, user.password)
        .then((HttpResponse response) {
          log.info('processing response');
          log.info(response);
          log.info(response.data);
          log.info(response.data['username']);
          var data = response.data;
          log.info('setting data/user');
          user.username = data['username'];
          user.displayname = data['displayname'];
          user.password = '';
          user.isAuthorized = true;
          
          _localStorage['username'] = user.username;
          _localStorage['isAuthorized'] = user.isAuthorized.toString();
          _localStorage['displayname'] = user.displayname;
          _localStorage['exists'] = 'true';
          log.info('finished processing response');
          /*response.data.map((_){
            user[_[0]] = _[1];
          });*/
        }).catchError((_) {
          log.info('catchError');
          log.info(_);
          user.password = '';
        });
    } else {
      api
        .register(user.username, user.password, user.displayname)
        .then((HttpResponse response) {
          log.info('processing response');
          log.info(response);
          var data = response.data;
          user.username = data['username'];
          user.displayname = data['displayname'];
          user.password = ''; 
          user.isAuthorized = true;

          _localStorage['username'] = user.username;
          _localStorage['isAuthorized'] = user.isAuthorized.toString();
          _localStorage['displayname'] = user.displayname;
          _localStorage['exists'] = 'true';
        }).catchError((_) {
          log.info('catchError');
          log.info(_);
          user.password = '';
        });
    }
  }
  
  void checkUser() {
    log.info("Checking whether $user.username exists.");
    api
      .checkuser(user.username)
      .then((HttpResponse response) {
        if (200 <= response.status && response.status < 300) {
          user.exists = true;
          log.info("$user.username exists");
        } else {
          user.exists = false;
          log.info("$user.username does not exist, show displayname input.");
        }
      }).catchError((_){
        user.exists = false;
        log.info("$user.username does not exist, show displayname input.");
        log.finest(_);
      });
  }
}

@Component(
    selector: 'body',
    templateUrl: 'app.html',
    cssUrl: CSS_URLs)
class AppView {
  final Logger log = new Logger('AppView');
  @NgTwoWay('user')
  User user;
  
  AppView(this.user) {
    log.info('App layout init');
    log.info(user.username);
    log.info(user);
  }
}

@Component(
    selector: 'footer',
    templateUrl: 'footer.html',
    cssUrl: CSS_URLs
)
class Footer {
  final Logger log = new Logger('User');
  API api;
  @NgTwoWay('user')
  User user;
  @NgTwoWay('room')
  Room room;
  @NgTwoWay('message')
  String message = '';
  Footer(this.user, this.api, this.room) {
    log.info('footer init');
    log.info(user);
    log.info(user.isAuthorized);
  }
  
  postMessage() {
    if (message.length < 1) { log.info('nothing to send'); }
    api.post_message(room.id, message).then((HttpResponse _){
      message = '';
      if (200 <= _.status && _.status < 300) {
        log.info('message sent');
        _.data['author'] = user;
        room.messages.add(_.data);
        room.load({'room_id':room.id});
      } else {
        log.info('smth went wrong');
      }
    }).catchError((_){}); // ignore exception
  }
}

@Component(
    selector: 'sidebar',
    templateUrl: 'sidebar.html',
    cssUrl: CSS_URLs
)
class Sidebar {
  final Http _http;
  var roomsListLoaded = false;

  @NgTwoWay('roomsSrv')
  $roomsService roomsSrv;
  
  final Logger log = new Logger('User');
  @NgTwoWay('user')
  User user;
  API api;
  
  Room room;

  @NgTwoWay('jrs')
  $joinedRoomsService jrs;

  Sidebar(this.user, this._http, this.api, this.room, $roomsService this.roomsSrv, $joinedRoomsService this.jrs) {
    jrs.refresh();
    print('sidebar init');
    print(user.username);
  }
  
  loadRoom(activeRoom) {
    //user.activeChat = room.name;
    log.info("Loading ${activeRoom['id']}");
    room.load(activeRoom);
  }
  
  listAllRooms() {
    roomsSrv.refresh();
  }
  
  logout() {
    log.info("Signing out $user.username.");
    user.isAuthorized = false;
    user.exists = true;
    room.id = null;
    room.name = '';
    room.messages = [];
    api
      .logout()
      .then((HttpResponse response) {
        if (200 <= response.status && response.status < 300) {
          log.info("$user.username exists");
        } else {
          log.info("$user.username session did not exist in server.");
        }
      }).catchError((_){
        log.info("$user.username does not exist, show displayname input.");
        //log.finest(_);
      });
  }  
}

@Component(
    selector: 'chat',
    templateUrl: 'chat.html',
    cssUrl: CSS_URLs
)
class Chat {
  final Logger log = new Logger('Chat');
  final API api;
  
  @NgTwoWay('room')
  Room room;
  
  @NgTwoWay('roomname')
  String roomname = '';

  @NgTwoWay('roomsSrv')
  $roomsService roomsSrv;
  
  $joinedRoomsService jrs;
  
  Chat(Room this.room, API this.api, $roomsService this.roomsSrv, $joinedRoomsService this.jrs) {
    log.info('chat init');
    log.info(room);
  }
  
  newRoom() {
    log.info(room);
    api.create_room(roomname)
        .then((HttpResponse _){
          room.load(_.data);
          jrs.refresh();
        }).catchError((_){ log.info('Room exists'); });
  }
  
  joinRoom(var _room) {
    log.info(_room);
    api.enter_room(_room['id'])
        .then((HttpResponse _){
          room.load(_.data);
          jrs.refresh();
        }).catchError((_){ log.info("Room doesn't exist"); });
  }
  
  leaveRoom(var _room) {
    log.info(_room);
    api.leave_room(_room.id)
        .then((HttpResponse _){
          room.id = null;
          jrs.refresh();
        }).catchError((_){ log.info("Room doesn't exist"); });
  }
}

@Component(
    selector: 'chat-message',
    templateUrl: 'chat_message.html',
    cssUrl: CSS_URLs
)
class ChatMessage {
  @NgTwoWay('message')
  var message;
  ChatMessage() {
    print('chat message init');
  }
}


class ChatApp extends Module {
  ChatApp() {
    bind(User);
    bind(Room);
    bind(API);
    bind(AppView);
    bind(LoginView);
    bind(Sidebar);
    bind(Chat);
    bind(ChatMessage);
    bind(Footer);
    bind($roomsService);
    bind($joinedRoomsService);
    //bind(RouteInitializerFn, toValue: chatAppRouteInitializer);
  }
}


void main() {
  setStaticReflectorAsDefault();
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
 
  staticApplicationFactory(generated_static_metadata.typeAnnotations, generated_static_expressions.getters, generated_static_expressions.setters, generated_static_expressions.symbols, generated_static_type_to_uri_mapper.typeToUriMapper)
    .addModule(new ChatApp())
    .run();
}
