import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';  // ios 风格

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由跳转的页面',
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: PageView(),
    );
  }
}

class PageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由页面'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return FlatButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
//                    flex: 1,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(15.0),
                  color: Colors.deepOrange,
                  child: Text(
                    '上海冬天好冷',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
