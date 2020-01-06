import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
    return Container(
      height: 40,
//      margin: EdgeInsets.fromLTRB(0, top, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40,
          ),
          Text(
            '购物车',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),

          Container(
//            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('编辑',
                style: TextStyle(fontSize: 18,),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
