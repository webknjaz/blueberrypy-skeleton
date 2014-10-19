// https://slack.com/ parody

//import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:logging/logging.dart' show Logger, Level, LogRecord;

const List<String> CSS_URLs = const [
                                     'https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css',
                                     'packages/angular/css/angular.css',
                                     'dartchat.css'
                                     ];


@Injectable()
class User {
  final Logger log = new Logger('User');
  String username = '<username>';
  String displayname = '';
  String password = '';
  bool isAuthorized = true; // TODO: set to false;
  bool exists = true;
  String activeChat = '#portaone';
  
  User() {
    log.info('User created');
  }
}


@Injectable()
class Room {
  final Logger log = new Logger('Room');
  
  API api;
  
  int id;
  String name = '#portaone'; // TODO: change to ''
  int creator_id;
  List messages = [
                   {'id': 0, 'text': 'hi, there!', 'user_id': 10, 'meta': {}, 'date_time': '12-12-2012'},
                   {'id': 1, 'text': 'hi!', 'user_id': 1, 'meta': {}, 'date_time': '12-12-2012'},
                   {'id': 2, 'text': 'hey!', 'user_id': 2, 'meta': {}, 'date_time': '12-12-2012'},
                   {'id': 3, 'text': 'greets!', 'user_id': 6, 'meta': {}, 'date_time': '12-12-2012'},
                   {'id': 4, 'text': 'good morning!', 'user_id': 17, 'meta': {}, 'date_time': '12-12-2012'},
                   {'id': 5, 'text': 'hey-hey!', 'user_id': 11, 'meta': {}, 'date_time': '12-12-2012'}
                   ];// TODO: replace with [];
  
  Room(this.api) {
    log.info('Room instance created');
  }
  
  load(var activeRoom) {
    api.list_messages(activeRoom.id)
      .then((HttpResponse _){
        id = activeRoom.id;
        name = activeRoom.name;
        creator_id = activeRoom.creator_id;
        messages = _.data.messages;
      }).catchError((_){});
  }
}

@Injectable()
class MemberRooms {
  final Logger log = new Logger('MemberRooms');
  API api;
  
  List _rooms;
  
  call() {
    return _rooms;
  }
    
  MemberRooms(this.api) {
    log.info('MemberRooms instance created');
    reloadRooms();
  }
  
  void reloadRooms() {
    api.list_joined_rooms()
      .then((HttpResponse _){
        _rooms = _.data;
        log.info('rooms list loaded');
      }).catchError((_){});
  }
}



@Injectable()
class ListRooms {
  final Logger log = new Logger('ListRooms');
  API api;
  
  List _rooms;
  
  call() {
    return _rooms;
  }
    
  ListRooms(this.api) {
    log.info('ListRooms instance created');
    reloadRooms();
  }
  
  void reloadRooms() {
    api.list_rooms()
      .then((HttpResponse _){
        _rooms = _.data;
        log.info('all rooms list loaded');
      }).catchError((_){});
  }
}

@Injectable()
class API {
  final Http _http;
  final Logger log = new Logger('API');
  
  String _endpoint(String _) => "/api/$_/";
  
  API(this._http) {
    log.info('API instance initialized');
  }
  
  void _unauthorize_on_fail(HttpResponse _) {
    if (_.status == 401) throw new Exception('User session expired');
  }

  login(String username, String password) {
    return _http.post( _endpoint('auth'),
                      {
                        'username':username,
                        'password':password
                      }
          ).then(_unauthorize_on_fail);
  }
  
  logout() {
    return _http.delete( _endpoint('auth'))
                .then(_unauthorize_on_fail);
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
          )
          .then(_unauthorize_on_fail);
  }
  
  list_joined_rooms() {
    return _http.get( _endpoint('user') + 'rooms' )
          .then(_unauthorize_on_fail);
  }
  
  list_own_rooms() {
    return _http.get( _endpoint('user') + 'rooms/own' )
          .then(_unauthorize_on_fail);
  }
  
  leave_room(int room_id) {
    return _http.delete( _endpoint('auth') + room_id.toString() )
                .then(_unauthorize_on_fail);
  }

  create_room(String roomname) { // TODO: autojoin room
    return _http.post( _endpoint('room'),
                      {
                        'name':roomname,
                      }
          )
          .then(_unauthorize_on_fail);
  }
  
  list_rooms() {
    return _http.get( _endpoint('room') )
          .then(_unauthorize_on_fail);
  }
  

  post_message(int room_id, String text, [meta = const{}]) { // TODO: return author info as well??
    return _http.post( _endpoint('room') + room_id.toString(),
                      {
                        'text':text,
                        'meta':meta
                      }
          )
          .then(_unauthorize_on_fail);
  }

  list_messages(int room_id) {
    return _http.get( _endpoint('room') +  room_id.toString() )
          .then(_unauthorize_on_fail);
  }
  
  enter_room(int room_id) {
    return _http.put( _endpoint('room'), {'room_id':room_id} ) // TODO: modify room_id retrieval @ backend
          .then(_unauthorize_on_fail);
  }
  
  /*void _loadData() {
    roomsListLoaded = false;
    
    _http.get('api/rooms.json')
      .then((HttpResponse response) {
        rooms = response.data;
        //recipes = response.data.map((d) => new Recipe.fromJson(d)).toList();
        roomsListLoaded = true;
      })
      .catchError((e) {
        roomsListLoaded = false;
        //message = ERROR_MESSAGE;
      });
    
  }*/
  /*
  void _loadData() {
    roomsListLoaded = false;
    
    _http.get('api/rooms.json')
      .then((HttpResponse response) {
        rooms = response.data;
        //recipes = response.data.map((d) => new Recipe.fromJson(d)).toList();
        roomsListLoaded = true;
      })
      .catchError((e) {
        roomsListLoaded = false;
        //message = ERROR_MESSAGE;
      });
    
  }*/
}



@Component(
    selector: 'login',
    templateUrl: 'login.html',
    cssUrl: CSS_URLs,
    useNgBaseCss: true)
class LoginView {
  final Logger log = new Logger('LoginView');
  @NgTwoWay('user')
  User user;
  API api;
  LoginView(User this.user, API this.api) {
    log.info('Login layout init');
    log.info(user.username);
    log.info(user.isAuthorized);
    log.info(user);
  }

  void reglogin() {
    log.info('reglogin clicked');
    if (user.exists) {
      api
        .login(user.username, user.password)
        .then((HttpResponse response) {
          var data = response.data;
          user.username = data.username;
          user.displayname = data.displayname;
          user.password = ''; 
          /*response.data.map((_){
            user[_[0]] = _[1];
          });*/
        }).catchError((_) {
          user.password = '';
        });
    } else {
      api
        .register(user.username, user.password, user.displayname)
        .then((HttpResponse response) {
          var data = response.data;
          user.username = data.username;
          user.displayname = data.displayname;
          user.password = ''; 
        }).catchError((_) {
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
          user.exists = response.data;
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
  Room room;
  @NgTwoWay('message')
  var message = '';
  Footer(this.user, this.api, this.room) {
    log.info('footer init');
    log.info(user);
    log.info(user.isAuthorized);
  }
  
  postMessage() {
    if (message.length < 1) { log.info('nothing to send'); }
    api.post_message(room.id, message).then((HttpResponse _){
      if (200 <= _.status && _.status < 300) {
        log.info('message sent');
        room.messages.add(_.data);
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
  @NgTwoWay('rooms')
  List rooms;
  MemberRooms RoomsListLoader;
  
  final Logger log = new Logger('User');
  @NgTwoWay('user')
  User user;
  API api;
  
  Room room;
  
  Sidebar(this.user, this._http, this.api, this.room, this.RoomsListLoader) {
    rooms = RoomsListLoader();
    print('sidebar init');
    print(user.username);
    _loadData();
  }
  
  refreshRoomsList() {
    RoomsListLoader.reloadRooms();
    rooms = RoomsListLoader();
  }
  
  loadRoom(activeRoom) {
    //user.activeChat = room.name;
    log.info("Loading $activeRoom.id");
    room.load(activeRoom);
  }
  
  void logout() {
    log.info("Signing out $user.username.");
    api
      .logout()
      .then((HttpResponse response) {
        if (200 <= response.status && response.status < 300) {
          log.info("$user.username exists");
        } else {
          log.info("$user.username session did not exist in server.");
        }
        user.isAuthorized = false;
        user.exists = true;
      }).catchError((_){
        user.isAuthorized = false;
        user.exists = true;
        log.info("$user.username does not exist, show displayname input.");
        log.finest(_);
      });
  }
  
  void _loadData() {
    roomsListLoaded = false;
    
    _http.get('api/rooms.json')
      .then((HttpResponse response) {
        rooms = response.data;
        //recipes = response.data.map((d) => new Recipe.fromJson(d)).toList();
        roomsListLoaded = true;
      })
      .catchError((e) {
        roomsListLoaded = false;
        //message = ERROR_MESSAGE;
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
  
  @NgTwoWay('room')
  Room room;
  
  Chat(this.room) {
    log.info('chat init');
    log.info(room);
    log.info(room.messages);
    log.info(room.messages[0]);
    log.info(room.messages[0]['id']);
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

/*void chatAppRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'login': ngRoute(
        path: '/login',
        view: 'login.html'),
    'add': ngRoute(
        defaultRoute: true,
        path: '/chat',
        view: 'app.html')
  });
}*/

class ChatApp extends Module {
  ChatApp() {
    bind(User);
    bind(Room);
    bind(MemberRooms);
    bind(API);
    bind(AppView);
    bind(LoginView);
    bind(Sidebar);
    bind(Chat);
    bind(ChatMessage);
    bind(Footer);
    //bind(RouteInitializerFn, toValue: chatAppRouteInitializer);
  }
}


void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
 
  applicationFactory()
    .addModule(new ChatApp())
    .run();
}
