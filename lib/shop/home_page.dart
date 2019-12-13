import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../service/home_service.dart';
import 'dart:convert'; // json 解析
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../adapter/home_adapter.dart';
import '../bean/home_list_bean.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../entity_factory.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List<HomeListBean> lists = List();
  HomeListBean mHomeListBean;
  @override
  void initState() {
    super.initState();
    getHomeRequestData().then((val){
      setState(() {
        List<Map> swiper = (val['data'] as List).cast();
        mHomeListBean = HomeListBean();
        mHomeListBean.itemTYpe = 1;
        mHomeListBean.swiper = swiper;
        lists.insert(0, mHomeListBean);
      });
    });

    getHomeCategoryData().then((val) {
      setState(() {
        List<Map> navigator = (val['subjects'] as List).cast();
        mHomeListBean = HomeListBean();
        mHomeListBean.itemTYpe = 2;
        mHomeListBean.navigators = navigator;
        if(lists.length >= 2){
          lists.insert(1,mHomeListBean);
        } else {
          lists.add(mHomeListBean);
        }
      });
    });

    getHomeList("1").then((val){
      setState(() {
//        var data = json.decode(val.toString());
//        HomeListBean bean = EntityFactory.generateOBJ<HomeListBean>(data);
        List<Map> datas = (val['results'] as List).cast();
        for(var item in datas){
          mHomeListBean = HomeListBean();
          mHomeListBean.titleT = item['site']['cat_cn'];
          mHomeListBean.desc = item['site']['desc'];
          mHomeListBean.imageUrl = item['site']['icon'];
          mHomeListBean.itemTYpe = 3;
          lists.add(mHomeListBean);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =  ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return buildListData(context, lists[index]);
        },
      ),
    );
  }

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;
}
