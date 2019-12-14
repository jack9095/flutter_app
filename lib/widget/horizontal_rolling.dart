import 'package:flutter/material.dart';
import 'package:flutter_app/bean/home_list_bean.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 首页水平滚动的组件
class HomeHorizontalWidget extends StatelessWidget {
  final List<Map> lists;

  const HomeHorizontalWidget({Key key, this.lists}) : super(key: key);
  // 水平滚动的标题栏
  Widget _titleWidget() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(44),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),
        // 装饰
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                // 给哪一边设置边框
                bottom: BorderSide(
              color: Colors.black12,
              width: 0.5, // 边框的大小（高度或者宽度）
            ))),
        child: Text(
          '水平推荐',
          style: TextStyle(fontSize: 20, color: Colors.redAccent),
        ),
      ),
    );
  }

  // 水平滚动 ListView 的 item 的 widget
  Widget _ListViewItemWidget(int index) { // 传入参数的变量 int 可以省略
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              right: BorderSide(
            color: Colors.black12,
            width: 0.5,
          )),
        ),
        margin: EdgeInsets.fromLTRB(10, 3, 8, 3),
        child: Column(
          children: <Widget>[
            Image.network(lists[index]['image']),
            SizedBox(height: ScreenUtil().setHeight(5),),
            Text(
              '￥${lists[index]['price']}',
              textAlign: TextAlign.left,
            ),
            Divider(height: ScreenUtil().setHeight(5),),
            Text(
              '￥${lists[index]['originalPrice']}',
              textAlign: TextAlign.left,
              style: TextStyle(
                decorationColor: Colors.black12, // 划线的颜色
                decorationStyle: TextDecorationStyle.solid, // 中划线
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _titleWidget(),
          ListView.builder(  // 水平滚动列表
            scrollDirection: Axis.horizontal, // 水平方向滚动
            itemCount: lists.length,
            itemBuilder: (context,index){
              return _ListViewItemWidget(index);
            },
          ),
        ],
      ),
    );
  }
}
