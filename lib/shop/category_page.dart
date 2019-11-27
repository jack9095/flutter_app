import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '分类',
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
