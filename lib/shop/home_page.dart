import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../service/home_service.dart';
import '../widget/home_banner.dart';
import '../widget/home_navigator.dart';
import 'dart:convert'; // json 解析
import 'package:flutter_easyrefresh/easy_refresh.dart';

// https://www.jianshu.com/p/87ffc4785bbf
// https://www.jianshu.com/p/d7f248b5facc
// https://www.jianshu.com/p/ff128e9cdea2
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getHomeCategoryData().then((val) {
      setState(() {
        print("数据");
        print(val.toString());
        List<Map> navigator = (val['subjects'] as List).cast();
        TopNavigation(topNavigationLists: navigator); //导航组件
      });
    });
  }

  List<int> stateItems = <int>[
    1, 1, 2, 2, 0, 1, 1, 1, 0, 1, 2, 2, 1, 2,
  ];
  List<String> strItems = <String>[
    '图标 -> keyboard', '图标 -> print', '图标 -> router',
    '图标 -> pages', '图标 -> zoom_out_map', '图标 -> zoom_out',
    '图标 -> youtube_searched_for', '图标 -> wifi_tethering', '图标 -> wifi_lock',
    '图标 -> widgets', '图标 -> weekend', '图标 -> web', '图标 -> accessible', '图标 -> ac_unit',
  ];
  List<Icon> iconItems = <Icon>[
     Icon(Icons.keyboard),  Icon(Icons.print),  Icon(Icons.router),
     Icon(Icons.pages),  Icon(Icons.zoom_out_map),  Icon(Icons.zoom_out),
     Icon(Icons.youtube_searched_for),  Icon(Icons.wifi_tethering),  Icon(Icons.wifi_lock),
     Icon(Icons.widgets),  Icon(Icons.weekend),  Icon(Icons.web),
     Icon(Icons.accessible),  Icon(Icons.ac_unit),
  ];

  Widget buildListData(
      BuildContext context, String strItem, Icon iconItem, int type) {
    Widget widget;
    switch (type) {
      case 1:
        widget = ListTile(
          isThreeLine: false,
          leading: iconItem,
          title:  Text(strItem),
          trailing:  Icon(Icons.keyboard_arrow_right),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return  AlertDialog(
                  title:  Text(
                    'ListViewDemo',
                    style:  TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                  ),
                  content:  Text('您选择的item内容为:$strItem,item 状态为 1'),
                );
              },
            );
          },
        );
        break;
      case 2:
        Widget wi;
        if ('图标 -> pages' == strItem) {
          wi = Offstage(
            offstage:false,
            child: Container(height: 10.0, color: Colors.amberAccent,),
          );
//          wi =  Container(height: 0.0, width: 0.0);
        } else {
          wi =  Text(
            strItem,
            style:  TextStyle(color: Colors.blueAccent, fontSize: 18.0),
          );
        }
        widget =  GestureDetector(
          child:  Column(
            children: <Widget>[
              iconItem,
              wi,
            ],
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return  AlertDialog(
                  title:  Text(
                    'ListViewDemo',
                    style:  TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                  ),
                  content:  Text('您选择的item内容为:$strItem,item 状态为 2'),
                );
              },
            );
          },
        );
        break;
      default:
        widget =  Container(
          height: 50.0,
          color: Colors.greenAccent,
          child:  Padding(
            padding:  EdgeInsets.all(12.0),
            child:  GestureDetector(
              child:  Text('我是状态为0的item'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return  AlertDialog(
                      title:  Text(
                        'ListViewDemo',
                        style:  TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                        ),
                      ),
                      content:  Text('哈哈哈！当前 item 状态为 0'),
                    );
                  },
                );
              },
            ),
          ),
        );
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
//    List<Map> swiper = List();
//    List<Map> navigators = List();
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: stateItems.length,
          itemBuilder: (context,index){
            return buildListData(context,strItems[index],iconItems[index],stateItems[index]);
          },
      ),
    );
  }
}
