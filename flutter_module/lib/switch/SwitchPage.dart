import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SwitchState();
  }
}

class SwitchState extends State<SwitchPage>{

  bool _switchSelected=true;//维护单选开关状态
  bool _checkboxSelected = true;//维护复选框状态

  //Checkbox的大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('单选框与复选框'),),
      body: Column(children: [
        Switch(
          activeColor: Colors.red,
          value: _switchSelected, onChanged: (value) {
          setState(() {
            _switchSelected = value;
          });
        },),
        Checkbox(
          activeColor: Colors.amber,
          value: _checkboxSelected, onChanged: (value) {
          setState(() {
            _checkboxSelected = value;
          });
        },)
      ],),
    );
  }

}