import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'shop/index.dart';

void main() => runApp(ShopWidget());

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
