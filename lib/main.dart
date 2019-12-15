import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'shop/index.dart';

// https://blog.csdn.net/ruoshui_t/article/details/95456751   获取状态栏高度 屏幕宽高
void main() {
  // 强制横屏
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.landscapeLeft,
//    DeviceOrientation.landscapeRight
//  ]);


  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(ShopWidget());
}

class ShopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '电商',
      theme: ThemeData(primaryColor: Colors.lightBlue),
      debugShowCheckedModeBanner: false, // 去掉右上角的 DEBUG
      home: IndexWidget(),
    );
  }
}
