import 'package:flutter/material.dart';

class OrderTitleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4.5, 0, 0, 0),
      height: 35,
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
                  '我的订单',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
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

            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            color: Colors.black12,
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
