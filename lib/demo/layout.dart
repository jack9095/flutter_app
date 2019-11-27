import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 卡片布局
  var card = Card(
    child: Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(
            '第一个',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
          ),
          subtitle: Text('fly 15268027898'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('http://t1.hxzdhn.com/uploads/tu/201803/9999/de979a4670.jpg'),
          ),
          // 最右边的箭头
          trailing: Icon(Icons.keyboard_arrow_right),
          // 设置内容边距,这里设置0，默认是16
          contentPadding: EdgeInsets.symmetric(horizontal:0.0),
          // 如果选中列表的 item 项，那么文本和图标的颜色将成为主题的主颜色
          selected: true,
          // 单击事件
          onTap: (){

          },
          // 长按事件
          onLongPress: (){

          },
          // 禁止点击
          enabled: false,
        ),
        // 分割线
        Divider(),
        ListTile(
          title: Text(
            '第二个',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
          ),
          subtitle: Text('fly 15268027898'),
          leading: Icon(Icons.account_box,color: Colors.lightBlue,),
        ),
        // 分割线
        Divider(),
        ListTile(
          title: Text(
            '第三个',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
          ),
          subtitle: Text('fly 15268027898'),
          leading: Icon(Icons.account_box,color: Colors.lightBlue,),
        ),
        // 分割线
        Divider(),
      ],
    ),
  );

  // 层叠布局
  var stack = Stack(
    // 对其属性,设置x轴和y轴的距离 值最小是0，最大是1
    alignment: FractionalOffset(0.5, 0.6),
    children: <Widget>[
      CircleAvatar(
        backgroundImage:
        NetworkImage("http://t1.hxzdhn.com/uploads/tu/201612/3/49.png"),
        radius: 100.0,
      ),
      // 容器
      Container(
        decoration: BoxDecoration(color: Colors.green),
        padding: EdgeInsets.all(10.0),
        child: Text('我是层叠布局'),
      ),
      // 定位组件
      Positioned(
        top: 20.0,
        left: 50.0,
        child: Text('第一个定位位置'),
      ),
      Positioned(
        bottom: 20.0,
        right: 80.0,
        child: Text('第二个位置'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "布局",
      home: Scaffold(
        appBar: AppBar(
          title: Text('布局demo'),
        ),
        body: Center(
          // 引入上面的层叠布局组件
//          child: stack,
          // 引入上面的卡片布局
          child: card,
        ),
//        body: Center(  // 水平居中
//          child: Column(
//            // 垂直布局
//            crossAxisAlignment:
//                CrossAxisAlignment.center, // 副轴布局，相对于包裹体，不是相对于屏幕
//            mainAxisAlignment: MainAxisAlignment.center, // 主轴对齐
//            children: <Widget>[
//          Expanded(child:Text('one'),),
//              Expanded(child:Text('twotwotwotwotwotwo'),),
//        Expanded(child:Text('three',),),
//            ],
//          ),
//        ),
        /*body: Row(  // 水平布局
          children: <Widget>[
            // 不灵活布局
            RaisedButton(
              onPressed: (){},
              color: Colors.red,
              child: Text('测试'),
            ),
            // Expanded 灵活布局，如果每个都使用，就是均分布局，相当于安卓中的权重
            Expanded(child: RaisedButton(
              onPressed: (){},
              color: Colors.lightBlue,
              child: Text('测试1'),
            ),),

            RaisedButton(
              onPressed: (){},
              color: Colors.deepPurpleAccent,
              child: Text('测试2'),
            ),
          ],
        ),*/
      ),
    );
  }
}
