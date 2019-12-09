import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart'; // 引入 banner 组件
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 引入屏幕适配组件

// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swipeDataList;

  SwiperDiy({Key key, this.swipeDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =  ScreenUtil(width: 750,height: 1334)..init(context);
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swipeDataList.length,
        itemBuilder: (BuildContext context,int index){
          // 这里 return 就是展示在界面上的元素
          return Image.network("${swipeDataList[index]['imagePath']}",fit: BoxFit.fill,);
        },
        autoplay: true, // 自动播放
        pagination: SwiperPagination(),  // 指示器
      ),
    );
  }
}