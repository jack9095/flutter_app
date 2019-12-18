import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/bean/category_bean.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/widget/category/category_layout.dart';
import 'package:flutter_app/widget/category/category_title_widget.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_hour_glass_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

// https://www.jianshu.com/p/eb4bf06a06ec  dart语法基础
// https://github.com/xuelongqy/flutter_easyrefresh/blob/v2/document/cn/PROPERTY.md  // 刷新库
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Subjects> lists = List();

  // 控制器
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//    _controller.callRefresh();
//    _controller.callLoad();
    getHomeCategoryData().then((val) {
//      var data = json.decode(val.toString());
      CategoryBean categoryBean = CategoryBean.fromJson(val);
      categoryBean.subjects.forEach((bean) => print("标题数据 = " + bean.title));
      setState(() {
        lists.addAll(categoryBean.subjects);
      });
    });

//    _controller.finishRefresh(success: true);
//    _controller.finishLoad(success: true, noMore: false);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CategoryTitleWidget(),
          Divider(height: 0.5,color: Color.fromARGB(255, 245, 245, 245),),
          Expanded(
            flex: 1,
            child: EasyRefresh(
//              header: MaterialHeader(),
//              footer: MaterialFooter(),

//              header: BezierHourGlassHeader(
//                color: Theme.of(context).scaffoldBackgroundColor,
//              ),
//              footer: BezierBounceFooter(
//                color: Theme.of(context).scaffoldBackgroundColor,
//              ),

//              enableControlFinishRefresh: false,
//              enableControlFinishLoad: true,
//              controller: _controller,
//              header: ClassicalHeader(),
//              footer: ClassicalFooter(),

              onRefresh: () async {
                // 刷新回调
                print('refresh');
                await Future.delayed(Duration(seconds: 2), () {
                  print('刷新完成');
                  _controller.resetLoadState();
//                  setState(() {
//                    _count = 20;
//                  });
                });
              },
              onLoad: () async {
                // 加载回调
                print('加载完成');
                _controller.finishLoad(noMore: false);
//                  setState(() {
//                    _count += 1;
//                  });
              },
              child: SingleChildScrollView(
                child: CategoryWidget(subjects: lists),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
