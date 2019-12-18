
import 'dart:core';

class TicketBean {
  List<Map> lists = List();
  Map<String,dynamic> map;

  List<Map> getData(){
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
}