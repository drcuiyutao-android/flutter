
import 'package:flutter/material.dart';
import 'package:flutter_module/home/FlutterMainPage.dart';
import 'package:flutter_module/home/FlutterTestPage.dart';
import 'package:flutter_module/navigator/NavigatorPage.dart';
import 'package:flutter_module/router/RouterUtil.dart';

const String NAVIGATOR_PAGE = "navigatorPage";
const String MAIN_PAGE = "mainPage";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InnerState();
  }
}

class _InnerState extends State<MyApp> {

  //充当白名单使用
  Map<String, WidgetBuilder> routes = {
    "loginPage": (context) => FlutterTestPage(),
  };

  //真正跳转
  Widget getOpenWidgetPage(String path, Object arguments){
    Widget widgetPage;
    switch(path){
      case NAVIGATOR_PAGE:
        widgetPage = NavigatorPage(arguments: arguments);
        break;
      case MAIN_PAGE:
        widgetPage = FlutterMainPage();
        break;
      default:
        widgetPage = Scaffold(
          appBar: AppBar(title: Text("错误页面"),),
           body: Center(
             child: Text("恭喜你走丢了"),
           ),
        );
    }
    return widgetPage;
  }

  //flutter 路由拦截
  Route<dynamic> interceptor(RouteSettings settings){
    String routeName = settings.name;
    print("routeName : $routeName");
    if (routeName.isNotEmpty) {
      // if(!isLogin){
      //   去登录
      //   return
      // }
        return MaterialPageRoute(builder: (context) {
          return getOpenWidgetPage(routeName, settings.arguments);
        });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    RouterUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app混编 flutter_boost",
      routes: routes,
      onGenerateRoute: interceptor,
      builder: RouterUtil.initPageListener(),
      home: FlutterMainPage(),
    );
  }
}
