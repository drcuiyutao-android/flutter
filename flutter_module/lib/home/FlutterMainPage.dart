import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/main.dart';
import 'package:flutter_module/router/RouterUtil.dart';

class FlutterMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InnerState();
  }
}

class _InnerState extends State<FlutterMainPage> {

  List<String> list = ["navigator 路由管理器",
    "flutter 跳转native， 并获得native 回传值",
    "Text 的一些基础用法",
    "Image 的基础用法"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Flutter 学习'),),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              switch(index){
                case 0:
                  // var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return NavigatorPage(params: "你好 我是来是来自首页的数据",);
                  // },));
                  var result = await Navigator.pushNamed(context, NAVIGATOR_PAGE, arguments: "我是来自首页的数据");
                  //var result = await Navigator.pushReplacementNamed(context, "navigatorPage", arguments: "拦截数据");
                  setState(() {
                    list[index] = result;
                  });
                  break;
                case 1:
                  RouterUtil.open(NATIVE_TEST_PAGE,
                      urlParams: <String, dynamic>{'params': "我是来自于flutter的数据"})
                      .then((Map<dynamic, dynamic> value) {
                        if(value.isNotEmpty && value['params'] is String){
                          String result = value['params'];
                          if (result.isNotEmpty){
                            setState(() {
                              print("收到native 返回的数据 [${value['params']}]");
                              list[index] = result;
                            });
                          }
                        }
                  });
                  break;
                case 2:
                  Navigator.pushNamed(context, TEXT_PAGE);
                  break;
                case 3:
                  Navigator.pushNamed(context, IMAGE_PAGE);
                  break;
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              height: 30,
              child:  Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: size.width,
                      child: Text("${list[index]}")),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  )
                ])
            ),
          );},),
        floatingActionButton: RaisedButton(
          color: Colors.blue,
          child: Text('test button', style: TextStyle(color: Colors.white),),
          onPressed: () {
            //TODO 点击事件
          },
        )
    );
  }
}