import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
