import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './cart_page.dart';
import './category_page.dart';
import './home_page.dart';
import './mine_page.dart';

class IndexWidget extends StatefulWidget {
  @override
  _IndexWidgetState createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {
  //  final List<BottomNavigationBarItem> BOTTOMTABS = [
//    BottomNavigationBarItem(
//      icon: Icon(CupertinoIcons.home),
//      title: Text('首页'),
//    ),
//  ];

  int currentIndex = 0;
  var currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = PAGE_WIDGET[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text('电商项目'),
//      ),
      backgroundColor: Color.fromRGBO(244, 255, 255, 1.0),
      // 设置这个组件就会把里面的组件置于最底部
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: BOTTOMTABS,
        currentIndex: currentIndex,
        onTap: (index) {
          // 刷新组件的方法
          setState(() {
            currentIndex = index;
            currentWidget = PAGE_WIDGET[currentIndex];
          });
        },
      ),
      body: currentWidget,
    );
  }
}

const BOTTOMTABS = [
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.home),
    title: Text('首页'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.search),
    title: Text('分类'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.shopping_cart),
    title: Text('购物车'),
  ),
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.profile_circled),
    title: Text('我的'),
  ),
];

final PAGE_WIDGET = [HomePage(), CategoryPage(), CartPage(), MinePage()];