import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<InputPage> {
  TextEditingController _editingController = TextEditingController(); //文本控制
  FocusNode _focusNode1 = FocusNode(); //焦点管理
  FocusNode _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: Column(
        children: [
          TextField(
            focusNode: _focusNode1,
            autofocus: true,
            controller: _editingController,
            onChanged: (value) {
              print(_editingController.text);
            },
            decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或者邮箱',
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            focusNode: _focusNode2,
            autofocus: true,
            obscureText: true,
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
                //下划线未获得焦点颜色
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                //下划线获得焦点颜色
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
          Row(
            children: [
              RaisedButton(
                child: Text("移动焦点"),
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode2);
                },
              ),
              RaisedButton(
                child: Text('隐藏键盘'),
                onPressed: () {
                  _focusNode1.unfocus();
                  _focusNode2.unfocus();
                },
              ),
            ],
          ),

          getThemeWidget()
        ],
      ),
    );
  }

  // 使用Theme 统一样式
  Widget getThemeWidget() {
    return Expanded(child: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0))),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名邮箱',
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.red, fontSize: 13.0)
              ),
            )
          ],
        )));
  }

  @override
  void dispose() {
    if (_editingController != null) {
      _editingController.dispose();
    }
    if (_focusNode1 != null) {
      _focusNode1.dispose();
    }
    if (_focusNode2 != null) {
      _focusNode2.dispose();
    }
    super.dispose();
  }
}
