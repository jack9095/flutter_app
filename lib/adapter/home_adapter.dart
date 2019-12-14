import 'package:flutter/material.dart';
import 'package:flutter_app/widget/home_view_item.dart';
import 'package:flutter_app/widget/horizontal_rolling.dart';
import '../widget/home_banner.dart';
import '../widget/home_navigator.dart';
import '../bean/home_list_bean.dart';

Widget buildListData(BuildContext context,HomeListBean bean) {
  Widget widget;
  switch (bean.itemTYpe) {
    case 1:
      widget = SwiperDiy(swipeDataList: bean.swiper);  // banner
      break;
    case 2:
      widget = TopNavigation(topNavigationLists: bean.navigators); //导航组件
      break;
    case 3:
      widget = HomeItemView(mHomeListBean: bean);
      break;
    case 4:
      widget  =  HomeHorizontalWidget(lists: bean.horizontalScrolls); // 水平滚动
      break;
  }
  return widget;
}