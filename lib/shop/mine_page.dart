import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/bean/mine_bean.dart';
import 'package:flutter_app/widget/mine/mine_user_view.dart';
import 'package:flutter_app/widget/mine/order_title_widget.dart';
import 'package:flutter_app/widget/mine/order_widget.dart';
import 'package:flutter_app/widget/mine/ticket_list_widget.dart';
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
    double statusHeight = MediaQuery.of(context).padding.top; // 手机顶部状态栏的高度
    // https://www.cnblogs.com/upwgh/p/11419310.html
    return Container(
      // a`是alpha值，0是透明的，255是完整的
      color: Color.fromARGB(255, 245, 245, 245),
      height: ScreenUtil().setHeight(1920),
      child: SingleChildScrollView(
        // 垂直方向滚动
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: BouncingScrollPhysics(),

        child: Container(
          child: Column(
            children: <Widget>[
              // 最上面的背景、会员、积分组件
              Stack(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(430),
                    decoration: BoxDecoration(
                      // 设置背景图片
                      image: DecorationImage(
                        image: AssetImage('images/mine_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  UserWidget(
                      image:
                          'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1096104534,858966386&fm=26&gp=0.jpg',
                      name: '王飞'),
                  TicketWidget(lists: MineBean().getData()),
                ],
              ),

              SizedBox(
                height: 13,
              ),

              // 我的订单
              OrderTitleWidget(),
              OrderWidget(
                lists: MineBean().getOrder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
