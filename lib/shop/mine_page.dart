import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
  // 圆形图片
  getImage(var imgUrl) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          image:
          DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
//          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
//      margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      height: 80.0,
      width: 80.0,
    );
  }


  @override
  Widget build(BuildContext context) {
    double topStatusBarHeight = MediaQuery.of(context).padding.top; // 手机顶部状态栏的高度
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(400),
              decoration: BoxDecoration(
                // 设置背景图片
                image: DecorationImage(
                  image: AssetImage('images/mine_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              getImage('https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1096104534,858966386&fm=26&gp=0.jpg'),
                  SizedBox(
                    width: ScreenUtil().setWidth(50),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil().setHeight(50),),
                      Text(
                        '王飞',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        '会员码',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(30, 80, 20, 15),
            ),
          ],
        ),
      ),
    );
  }
}
