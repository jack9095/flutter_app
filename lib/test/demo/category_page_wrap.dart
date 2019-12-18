import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bean/category_bean.dart';
import 'package:flutter_app/widget/category/category_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// https://www.jianshu.com/p/eb4bf06a06ec  dart语法基础
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
//  List<CategoryBean> lists = List();
  List<Map> lists = List();
  Map<String, String> map;

  @override
  void initState() {
    super.initState();
    map = Map();
    map['image'] =
        "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3463180431,3939423740&fm=26&gp=0.jpg";
    map['title'] = "风景";
    map['price'] = "2019-12-15";
    for (var x = 0; x < 22; x++) {
      lists.add(map);
    }
  }

  _phoneClick() async {
    String url = 'tel:' + "18869998756";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url 不合法';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = size.width; // 屏幕宽度
    double height = size.height; // 屏幕高度
    double topPadding = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(  // 顶部状态栏的容器
            color: Colors.blue,
            height: topPadding,
          ),
//        Divider(height: topPadding,),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
              icon: Icon(
//                Icons.arrow_back_ios,
                Icons.wb_incandescent,
                color: Colors.black,
              ),
//              onPressed: () => Navigator.pop(context),
            ),
                Text(
                  '分类',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: _phoneClick,
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            // 这里加 Container 会变成1列，具体原因还没找到，所以这里就不加了
//          child: Container(
//            alignment: Alignment.topLeft,
//            color: Colors.cyan,
//            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SingleChildScrollView(
//              padding: EdgeInsets.all(10), // 这里不能设置padding 否则也是显示一列
//              child: CategoryWidget(lists: lists),
            ),
//          ),
          ),

//        SizedBox(height: ScreenUtil().setHeight(10)),
        ],
      ),
    );
  }
}
