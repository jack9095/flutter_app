import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '导航演示',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: Container(
        alignment: FractionalOffset(0.5, 0.5),
        child: RaisedButton(
          child: Text("点击跳转"),
            onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage()));
            }),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
      ),
      body: Container(
        alignment: FractionalOffset(0.5, 0.5),
        child: RaisedButton(
            child: Text("返回第一个页面"),
            onPressed: (){
              Navigator.pop(context);
            }),
      ),
    );
  }
}