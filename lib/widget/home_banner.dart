import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入 banner 组件

// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swipeDataList;

  SwiperDiy({Key key, this.swipeDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333.0,
      child: Swiper(
        itemCount: swipeDataList.length,
        itemBuilder: (BuildContext context,int index){
          // 这里 return 就是展示在界面上的元素
          return Image.network("${swipeDataList[index]['image']}",fit: BoxFit.fill,);
        },
        autoplay: true, // 自动播放
        pagination: SwiperPagination(),  // 指示器
      ),
    );
  }
}