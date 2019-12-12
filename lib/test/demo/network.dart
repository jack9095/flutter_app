import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dio网络请求',
    theme: ThemeData(
      primaryColor: Colors.lightBlue
    ),
    home: FirstPage(),
  ));
}

var hotMovies = 'http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a';

class FirstPage extends StatelessWidget {
  var movies = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio网络请求'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('点击事件',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.red),),
              onPressed: _getFilmList,
            ),
            Text('$movies')
          ],
        ),
      ),
    );
  }

  void _getFilmList() async{
    Dio dio = new Dio();
    Response response = await dio.get(hotMovies);
    movies = response.toString();
    print("电影数据= " + movies);
  }
}

// https://segmentfault.com/a/1190000019935258?utm_source=tag-newest
// get 网络请求
void getRequest() async {
  try {
    Dio dio = new Dio();
    // 这两种写法是一样的
//    var response = await dio.get("/test?id=12&name=wendu");
    Response response = await dio.get(
        "/test", queryParameters: {"id": 12, "name": "wendu"});
    print(response.data.toString());
  } catch (e) {
    print(e);
  }
}

// post 请求
void postRequest() async {
  Dio dio = new Dio();
  var requestData = {'id': 10,'name': '旺财'};
  Response response = await dio.post('/test', data: requestData);
  print(response.data.toString());
}

// 多个并发请求
void moreRequest() async{
  Dio dio = new Dio();
  await Future.wait([dio.post('/test',data:{'id':90,'name': 'jack'}),dio.get('/y',queryParameters: {'id': 89})]);

}

// 下载文件
void downFile() async{
  Dio dio = new Dio();
//  Response response = await dio.download('/test', savePath);
}
