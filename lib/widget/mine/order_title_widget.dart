import 'package:flutter/material.dart';

class OrderTitleWidget extends StatelessWidget {

  final String title;
  final bool isArrow;

  const OrderTitleWidget({Key key, this.title, this.isArrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 45,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(5.0),topRight: Radius.circular(5.0)),
        color: Colors.white,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Offstage(
                offstage: isArrow,  // true 隐藏 false 显示
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '全部订单',
                        style: TextStyle(
                          color: Color.fromARGB(255, 153, 153, 153),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Image.asset('images/mine_arrow.png',
                        height: 15,
                        width: 18,),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: Colors.black12,
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
