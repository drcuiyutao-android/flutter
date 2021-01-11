
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ImagePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ImagePageState();
  }
}

class ImagePageState extends State<ImagePage>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text('image 用法'),),
        body: Column(
          children: [
            Image(
              image: AssetImage("assets/images/loading02.png"),
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            Image(
              image: NetworkImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201408%2F30%2F20140830180834_XuWYJ.png&refer=http%3A%2F%2Fcdn.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612928129&t=faf39cfa1bc2eb621f13fd9583b93cb5"),
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            )
          ],
        ),
      );
  }

}