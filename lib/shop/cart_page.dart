import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bean/cart_bean.dart';
import 'package:flutter_app/eventBus/event_bus.dart';
import 'package:flutter_app/widget/shop_card/caed_list_widget.dart';
import 'package:flutter_app/widget/shop_card/card_title_view.dart';
import 'dart:async';

import 'package:toast/toast.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StreamSubscription _dataChange;
  var datas = CartBean().getData();
  List<CartBean> lists =  List();

  @override
  void initState() {
    super.initState();

    // TODO 订阅 EventBus
    _dataChange = eventBus.on<CenterEvent>().listen((event) {
      var type = event.type;
      switch (type) {
        case 'is_selected':
          Toast.show("eventBus 传递消息", context);
          setState(() {
            int index = event.obj as int;
            for(int i = 0; i < datas.length; i++){
              if(i == index){
                print('改变选中状态');
                datas[index].isChecked = !datas[index].isChecked;
              }
            }

            lists.addAll(datas);

            datas.clear();
            datas.addAll(lists);
//            CartBean mCartBean = CartBean();
//            mCartBean.title = "购物车数据1";
//            mCartBean.content = "这是一个商品";
//            mCartBean.isChecked = true;
//            mCartBean.image = 'https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1719063513,2559625643&fm=26&gp=0.jpg';
//            datas.add(mCartBean);
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // TODO 取消订阅 EventBus
    _dataChange.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CardWidget(),
      ),
      body: CartListWidget(lists: datas),
    );
  }
}
