import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketWidget extends StatelessWidget {

  final List<Map> lists;

  const TicketWidget({Key key, this.lists}) : super(key: key);

  Widget _ticketView(String number,String title){
    return Container(
//      alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              number,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(37),
                color: Colors.black,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10),),
            Text(title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: Colors.black54,
            ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(15, ScreenUtil().setHeight(360), 15, 0),
      padding: EdgeInsets.fromLTRB(4.5, 0, 0, 0),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: GridView.count(
        // TODO 这里不设置 padding 会有默认距离顶部的距离
        padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
        crossAxisCount: 4,
        physics: const NeverScrollableScrollPhysics(),  // 禁止滑动
        children: lists.map((val){
          return _ticketView(val['number'],val['title']);
        }).toList(),
      ),
    );
  }
}
