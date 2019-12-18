import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final List<Map> lists;

  const OrderWidget({Key key, this.lists}) : super(key: key);

  Widget _orderView(image, title, visible) {

    // 圆形头像
//    CircleAvatar(
//      backgroundImage: NetworkImage( 'url'),
//      radius: 100,
//    ),

    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                height: 30,
                width: 40,
              ),
              Text(title),
            ],
          ),
          // 控制隐藏显示的组件
          Offstage(
            offstage: visible, // true 隐藏 false 显示
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(20, 1, 0, 0),
              height: 15,
              width: 15,
              child: Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0)),
        color: Colors.white,
      ),
      child: GridView.count(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        crossAxisCount: 4,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
        children: lists.map((item) {
          return _orderView(item['image'], item['title'], item['visible']);
        }).toList(),
      ),
    );
  }
}
