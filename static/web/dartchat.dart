// https://slack.com/ parody

//import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

const List<String> CSS_URLs = const [
                                     'https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css',
                                     'dartchat.css'
                                     ];

@Component(
    selector: 'body',
    templateUrl: 'app.html',
    cssUrl: CSS_URLs,
    useNgBaseCss: true )
class AppView {
  AppView() {
    print('App layout init');
    print(name);
  }
  @NgTwoWay('name')
  String name = '<username>';
}

@Component(
    selector: 'footer',
    templateUrl: 'footer.html',
    cssUrl: CSS_URLs
)
class Footer {
  Footer() {
    print('footer init');
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
  var rooms = [];
  @NgTwoWay('name')
  String name = '<username>';
  
  Sidebar(this._http) {
    print('sidebar init');
    print(name);
    _loadData();
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
  Chat() {
    print('chat init');
  }
}

@Component(
    selector: 'chat-message',
    templateUrl: 'chat_message.html',
    cssUrl: CSS_URLs
)
class ChatMessage {
  ChatMessage() {
    print('chat message init');
  }
}

void chatAppRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'login': ngRoute(
        path: '/login',
        view: 'login.html'),
    'add': ngRoute(
        path: '/add',
        view: 'view/addRecipe.html')/*,
    'recipe': ngRoute(
        path: '/recipe/:recipeId',
        mount: // ...*/
  });
}

class ChatApp extends Module {
  ChatApp() {
    bind(AppView);
    bind(Sidebar);
    bind(Chat);
    bind(ChatMessage);
    bind(Footer);
    bind(RouteInitializerFn, toValue: chatAppRouteInitializer);
  }
}


void main() {
  
  //ngBootstrap();
  /*querySelector("#sample_text_id")
      ..text = "Click me!"
      ..onClick.listen(reverseText);*/
  
  applicationFactory()
    //.rootContextType(Chat)
    //.addModule(new RecipeBookController())
    //.addModule(new User())
    //.addModule(new Test())
    .addModule(new ChatApp())
    .run();
}
