import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../service/home_service.dart';
import '../widget/home_banner.dart';
import 'dart:convert'; // json 解析

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    if(navigatorList.length>10){
////      navigatorList.removeRange(10, navigatorList.length);
////    }
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      // FutureBuilder 可以完美解决异步请求渲染界面的组件，而且不用动态（setState()方法）
      body: FutureBuilder(
        // future 接受的就是异步方法
        future: getHomeRequestData(),
        // 异步方法的接收
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // 判断是否有数据
//            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (snapshot.data['data'] as List).cast();
            return Column(
              children: <Widget>[
                SwiperDiy(swipeDataList: swiper),
              ],
            );
          } else {
            return Center(
              child: Text('数据加载中.....'),
            );
          }
        },
      ),
    );
  }
}
