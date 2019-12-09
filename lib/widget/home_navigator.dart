import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigation extends StatelessWidget{
  final List topNavigationLists;

  TopNavigation({Key key, this.topNavigationLists}) : super(key: key);

  Widget _gridViewItemUi(BuildContext context,item){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width: ScreenUtil().setWidth(95),),
          Text(item['']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      child: GridView.count(
          crossAxisCount: 5,
        padding: EdgeInsets.all(3.0),
        children: topNavigationLists.map((item){
          return _gridViewItemUi(context,item);
        }
        ).toList(),
      ),
    );
  }
}
