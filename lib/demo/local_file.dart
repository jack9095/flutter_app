import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '引入本地资源文件',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('引入本地资源文件'),),
      body: Center(
        child: Image.asset('images/scener.jpg'),
      ),
    );
  }
}

