import 'package:flutter/material.dart';

// https://segmentfault.com/a/1190000015150843
//传递参数，ListView动态展示
void main() =>
    runApp(MyApp(items: List<String>.generate(100, (i) => "item $i")));

class MyApp extends StatelessWidget {
  List<String> items;

//  @required表示必须要传的参数
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fei.wango',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(items: this.items),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.items}) : super(key: key);
  final List<String> items;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转'),
      ),
      body: Container(
        child: RaisedButton(
            child: Text('跳转下一页'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FourthRoute(
                            items: widget.items,
                          )));
            }),
      ),
    );
  }
}

class FourthRoute extends StatelessWidget {
  List<String> items;

  FourthRoute({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "哈哈",
      home: Scaffold(
        appBar: AppBar(
          title: Text("第四个页面"),
        ),
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              // 纵轴的距离
              mainAxisSpacing: 2.0,
              // 横轴之间的距离
              crossAxisSpacing: 3.0,
              // item的宽高比
              childAspectRatio: 0.7
            ),
          children: <Widget>[
            Image.network("http://img5.mtime.cn/mg/2019/11/06/200207.86791302_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/174754.98513443_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/145804.54416410_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/112049.61347256_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/104254.11207170_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/101733.37484776_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/05/224905.96824312_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/05/173137.68981377_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/05/183121.25425466_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/093345.24810831_285X160X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/05/101451.77709503_236X116X4.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/10/10/105634.78390501.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/01/112503.14149537.jpg",fit: BoxFit.cover,),
            Image.network("http://img5.mtime.cn/mg/2019/11/06/085850.22750557_285X160X4.jpg",fit: BoxFit.cover,),
          ],
        ),
        // 这是之前用法，目前不推荐
//        body: GridView.count(
//          padding: const EdgeInsets.all(20.0),
//            // 网格间距
//            crossAxisSpacing: 10.0,
//            // 每一行显示多少列
//            crossAxisCount: 3,
//          // 子元素，每个网格中的东西
//          children: <Widget>[
//              const Text("one"),
//              const Text("two"),
//              const Text("three"),
//              const Text("four"),
//              const Text("five"),
//              const Text("six"),
//          ],
//        )
      ),
    );
  }
}


