import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextPageState();
  }
}

class TextPageState extends State<TextPage> {
  final TapGestureRecognizer _recognizer =TapGestureRecognizer();
  @override
  void initState() {
    super.initState();
    _recognizer.onTap =(){
      print("我被点击了");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text 的一些基础用法'),),
      body: Column(
        children: [
          getTextAlignView(),
          getMaxLinesAndOverFlow(),
          getTextStyle(),
          getTextSpan(),
          getDefaultTextStyle()
        ],
      ),
    );
  }

  ///TextAlign 使用
  Widget getTextAlignView(){
    return Container(
      height: 60,
      alignment: Alignment.center,//如果外层设置了alignment 设置控件位置
      color: Colors.cyan,
      child: Text("TextAlign" *5 ,textAlign: TextAlign.left,textScaleFactor:1.5), //TextAlign 文字多行时的对齐方式
    );
  }

  /// 最大行数和末尾省略号使用
  Widget getMaxLinesAndOverFlow(){
    return Container(
      height: 60,
      color: Colors.amber,
      child: Text("你好 flutter" * 20, maxLines: 1, overflow: TextOverflow.ellipsis,),
    );
  }

  /// TextStyle 使用
  Widget getTextStyle(){
    return Container(
      color: Colors.red,
      height: 60,
      alignment: Alignment.center,
      child: Text("你好周杰伦", style: TextStyle(
        color: Colors.blue,//字体颜色
        fontSize: 20,//字体大小
        height: 1.2,//行间距
        background: Paint()..color = Colors.yellow,//背景色
        decoration: TextDecoration.underline,//下划线
        decorationStyle: TextDecorationStyle.dashed,//虚线
      ),),
    );
  }

  ///TextSpan使用
  Widget getTextSpan(){
    return Container(
      color: Colors.blueAccent,
      height: 60,
      alignment: Alignment.center,
      child: RichText(text: TextSpan(
        text: "网址：",
            style: TextStyle(color: Colors.red),
        children: [
          TextSpan(
            text: "https://book.flutterchina.club/chapter3/text.html",
            style: TextStyle(color: Colors.black),
            recognizer: _recognizer
          )
        ]
      ),),
    );
  }

  ///defaultTextStyle
   Widget getDefaultTextStyle(){
    return Container(
      color: Colors.deepPurple,
      height: 80,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.red, fontSize: 20.0),
        textAlign: TextAlign.start,
        child: Column(
          children: [
            Text("你好 哇咔卡"),
            Text("ayoukouk"),
            Text("不使用统一样式", style: TextStyle(inherit: false, color: Colors.cyan),)
          ],
        ),
      ),
    );
   }

}
