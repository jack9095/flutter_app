import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 流式布局 代替listView 和 GridView
class CategoryWidget extends StatelessWidget {

  final List lists;

  const CategoryWidget({Key key, this.lists}) : super(key: key);

  Widget _wrapList(){
    if(lists.length != 0){
      List<Widget> listWidget = lists.map((val){
        return InkWell(
          onTap: (){

          },
          child: Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(372), // 两个item中间留点距离，屏幕宽设置750，这里就是一半小一点 372
            height: ScreenUtil().setHeight(160),
            margin: EdgeInsets.only(bottom: 2), // 上下item之间设置距离
//            margin: EdgeInsets.fromLTRB(10,0,10,2),
            padding: EdgeInsets.fromLTRB(40,0,0,0),
            child: Row(
              children: <Widget>[
                Image.network(val['image'],
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(100),
                  alignment: Alignment.centerLeft,),
                SizedBox(width: ScreenUtil().setWidth(25),),
                Text(val['title'],textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
      }).toList();

      // 返回流式布局
      return Wrap(
        spacing: 2, // 两列
        children: listWidget,
      );
    } else {
      return Text('数据为空');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _wrapList();
  }

}