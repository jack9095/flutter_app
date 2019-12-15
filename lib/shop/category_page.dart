import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bean/category_bean.dart';
import 'package:flutter_app/service/home_service.dart';
import 'package:flutter_app/widget/category_layout.dart';
import 'package:flutter_app/widget/category_title_widget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// https://www.jianshu.com/p/eb4bf06a06ec  dart语法基础
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Subjects> lists = List();

  // 控制器
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getHomeCategoryData().then((val){
//      var data = json.decode(val.toString());
      CategoryBean categoryBean = CategoryBean.fromJson(val);
      categoryBean.subjects.forEach((bean) => print("标题数据 = "+bean.title));
      setState(() {
        lists.addAll(categoryBean.subjects);
      });
    });
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
          Expanded(
            flex: 1,
            child: EasyRefresh(
              controller: _controller,
              onRefresh: () async {
                print('refresh');
                await Future.delayed(Duration(seconds: 2), () {
                  print('刷新完成');
                  setState(() {
//                    _count = 20;
                  });
                });
              },
              onLoad: () async {
                print('load');
                await Future.delayed(Duration(seconds: 2), () {
                  print('加载完成');
                  setState(() {
//                    _count += 1;
                  });
                });
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
