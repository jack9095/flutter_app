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

  @override
  Widget build(BuildContext context) {
    double topStatusBarHeight = MediaQuery.of(context).padding.top; // 手机顶部状态栏的高度
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              // 设置背景图片
              image: DecorationImage(
                  image: AssetImage('images/mine_bg.jpg'),
              ),
            ),
            height: ScreenUtil().setHeight(200),
            child: Padding(
              child: Row(
                children: <Widget>[

                ],
              ),
              padding: EdgeInsets.fromLTRB(15, 70, 15, 15),
            ),
          ),
        ],
      ),
    );
  }
}
