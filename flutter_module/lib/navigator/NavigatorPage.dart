import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  final Object arguments;

  NavigatorPage({Key key, @required this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NavigatorState();
  }
}

class NavigatorState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, "我是Navigator返回值");
            //r如果使用pushReplacementNamed
            //Navigator.of(context).pushNamedAndRemoveUntil(MAIN_PAGE, (Route<dynamic> route)=>false);
          },
          child: Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text("返回")),
        ),
        title: Text("${widget.arguments}"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(title: Text('你确定要退出吗？'), actions: <Widget>[
                    RaisedButton(
                        child: Text('退出'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          Navigator.pop(context, "我是Navigator返回值");
                        }),
                    RaisedButton(
                        child: Text('取消'),
                        onPressed: () => Navigator.of(context).pop(false)),
                  ]));
          return false; //返回true 将会由flutter_boost接管
           },
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context, "我是Navigator返回值");
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "${widget.arguments}",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
