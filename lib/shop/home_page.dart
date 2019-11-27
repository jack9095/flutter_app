import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '首页',
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
