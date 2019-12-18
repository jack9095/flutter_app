
import 'dart:core';

class MineBean {
  List<Map> lists;
  Map<String,dynamic> map;

  List<Map> getData(){
    lists = List();
    map = Map();
    map['number'] = "90000";
    map['title'] = "普通分";
    lists.add(map);

    map = Map();
    map['number'] = "200";
    map['title'] = "会员分";
    lists.add(map);

    map = Map();
    map['number'] = "200";
    map['title'] = "卡券";
    lists.add(map);

    map = Map();
    map['number'] = "200";
    map['title'] = "收藏";
    lists.add(map);
    return lists;
  }

  List<Map> getOrder(){
    lists = List();
    map = Map();

    map['image'] = "images/mine_made.png";
    map['title'] = "待付款";
    map['visible'] = false;
    lists.add(map);

    map = Map();
    map['image'] = "images/mine_shipped.png";
    map['title'] = "待发货";
    map['visible'] = true;
    lists.add(map);

    map = Map();
    map['image'] = "images/mine_received.png";
    map['title'] = "待收货";
    map['visible'] = true;
    lists.add(map);

    map = Map();
    map['image'] = "images/mine_good.png";
    map['title'] = "退货";
    map['visible'] = true;
    lists.add(map);
    return lists;
  }
}