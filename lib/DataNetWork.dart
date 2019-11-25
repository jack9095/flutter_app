import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as Convert;
//import 'package: ../bean/UserResponse.dart';

void main() {
  runApp(MaterialApp(
    title: '网络请求联调',
    theme: ThemeData(primaryColor: Colors.lightBlue),
    home: NetWorkWidget(),
  ));
}

class NetWorkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '网络请求数据联调',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: DataListView(),
    );
  }
}

class DataListView extends StatefulWidget {
  @override
  _State createState() => _State();
}

// 页面保持状态 AutomaticKeepAliveClientMixin
class _State extends State<DataListView> with AutomaticKeepAliveClientMixin {
  var url = 'http://api.douban.com/v2/movie/top250?start=25&count=10&apikey=0df993c66c0c636e29ecbb5344252a4a';
  var subjects = [];
  var itemHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getListViewContainer(),
    );
  }

  void requestData() async {
    Dio dio = new Dio();
    Response response = await dio.get(url);
    print(response.toString());
    Map jsonDecode = Convert.jsonDecode(response.toString());
    // setState(){}的调用时吧视图重新绘制了一遍，但是并不是把整个视图 diss 掉再从新绘制。
    // 而是调用了 build 方法，绘制只是绘制不一样的地方
    setState(() {
      subjects = jsonDecode['subjects'];
    });
  }

  @override
  void initState() {
    super.initState();
    requestData();
  }

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;

  getListViewContainer() {
    if (subjects.length == 0) {
      //loading ios风格的加载框
      return CupertinoActivityIndicator(
        radius: 30.0, // 加载框半径
        animating: false, // 是否播放动画
      );
    }
    return ListView.builder(
        // item 的数量
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            // Flutter 手势处理
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numberWidget(index + 1),
                  getItemContainerView(subjects[index]),
                  //下面的灰色分割线
                  Container(
                    height: 10,
                    color: Color.fromARGB(255, 234, 233, 234),
                  )
                ],
              ),
            ),
            onTap: () {
              //监听点击事件
              print("click item index=$index");
            },
          );
        });
  }

  //NO.1 图标
  numberWidget(var no) {
    return Container(
      child: Text(
        'No.$no',
        style: TextStyle(color: Color.fromARGB(255, 133, 66, 0)),
      ),
      //  背景装饰 和 背景 color 不能共存
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 201, 129),
          // 四角的圆弧度
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }

  getItemContainerView(var subject) {
    var imgUrl = subject['images']['medium'];
    return Container(
      // double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          getImage(imgUrl),
          // https://blog.csdn.net/chunchun1230/article/details/82460257
          // 类似于权重
          Expanded(
            child: getMovieInfoView(subject),
            flex: 1,  // 把剩下的布局撑满
          )
        ],
      ),
    );
  }

  // 圆角图片
  getImage(var imgUrl) {
    return Container(
      decoration: BoxDecoration(
          image:
          DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      height: itemHeight,
      width: 100.0,
    );
  }

  //电影标题，星标评分，演员简介Container
  getMovieInfoView(var subject) {
    var start = subject['rating']['average'];
    return Container(
      height: itemHeight,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          getTitleView(subject),
          RatingBar(start),
          DescWidget(subject)
        ],
      ),
    );
  }

  //肖申克的救赎(1993) View
  getTitleView(subject) {
    var title = subject['title'];
    var year = subject['year'];
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.play_circle_outline,
            color: Colors.redAccent,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text('($year)',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey))
        ],
      ),
    );
  }

  getStaring(var stars) {
    return Row(
      children: <Widget>[RatingBar(stars), Text('$stars')],
    );
  }

}

//类别、演员介绍
class DescWidget extends StatelessWidget {
  var subject;

  DescWidget(this.subject);

  @override
  Widget build(BuildContext context) {
    var casts = subject['casts'];
    var sb = StringBuffer();
    var genres = subject['genres'];
    for (var i = 0; i < genres.length; i++) {
      sb.write('${genres[i]}  ');
    }
    sb.write("/ ");
    List<String> list = List.generate(
        casts.length, (int index) => casts[index]['name'].toString());

    for (var i = 0; i < list.length; i++) {
      sb.write('${list[i]} ');
    }
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        sb.toString(),
        softWrap: true,
        textDirection: TextDirection.ltr,
        style:
            TextStyle(fontSize: 16, color: Color.fromARGB(255, 118, 117, 118)),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  double stars;

  RatingBar(this.stars);

  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    //实心星星
    var startNumber = stars ~/ 2;
    //半实心星星
    var startHalf = 0;
    if (stars.toString().contains('.')) {
      int tmp = int.parse((stars.toString().split('.')[1]));
      if (tmp >= 5) {
        startHalf = 1;
      }
    }
    //空心星星
    var startEmpty = 5 - startNumber - startHalf;

    for (var i = 0; i < startNumber; i++) {
      startList.add(Icon(
        Icons.star,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    if (startHalf > 0) {
      startList.add(Icon(
        Icons.star_half,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    for (var i = 0; i < startEmpty; i++) {
      startList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 18,
      ));
    }
    startList.add(Text(
      '$stars',
      style: TextStyle(
        color: Colors.grey,
      ),
    ));
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 5),
      child: Row(
        children: startList,
      ),
    );
  }
}
