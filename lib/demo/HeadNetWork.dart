import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../config/http_header.dart';

void main(){
  runApp(MaterialApp(
    title: '加入请求头',
    home: PageWidget(),
  ));
}

class PageWidget extends StatefulWidget {
  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
    String showText = '默认数据';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用请求头'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                _requestData();
              },
              child: Text('进行网络请求'),
            ),
          ],
        ),
      ),
    );
  }
  void _requestData(){
    httpHead().then((val){
      setState(() {
        showText = val.toString();
      });
    });
  }

  Future httpHead() async{
    try{
      print('开始请求极客时间');
      Response reponse;
      Dio dio = Dio();
      // 加入请求头
      dio.options.headers = headers;
      reponse = await dio.post('https://time.geekbang.org/library',data:{"category":"1"});
      return reponse;
    }catch(e){
      return print(e);
    }
  }
}
