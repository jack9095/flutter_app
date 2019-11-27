import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '购物车',
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
