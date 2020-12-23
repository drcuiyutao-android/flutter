import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/main.dart';

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
           // Navigator.pop(context, "我是Navigator返回值");
            Navigator.of(context).pushNamedAndRemoveUntil(MAIN_PAGE, (Route<dynamic> route)=>false);

          },
          child: Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text("返回")),
        ),
        title: Text("${widget.arguments}"),
      ),
      body: GestureDetector(
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
    );
  }
}
