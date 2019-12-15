import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import '../webview/web_view.dart';

class TopNavigation extends StatelessWidget {
  final List topNavigationLists;

  const TopNavigation({Key key, this.topNavigationLists}) : super(key: key);

  Widget _gridViewItemUi(BuildContext context, item) {
    return InkWell(
      onTap: () {
//          Toast.show(item['title'], context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewWidget(url: item['alt'],title: item['title'],)));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['images']['small'],
            width: ScreenUtil().setWidth(95),
            height: ScreenUtil().setHeight(95),
            fit: BoxFit.fill,
          ),
          SizedBox(height: ScreenUtil().setHeight(10),),
          Text(
            item['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.normal,
//              fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),  // 禁止滑动
        crossAxisCount: 5,
        padding: EdgeInsets.all(3.0),
        children: topNavigationLists.map((item) {
          return _gridViewItemUi(context, item);
        }).toList(),
      ),
    );
  }
}
