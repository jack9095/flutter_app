import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fei.wango',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'fei.wang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("点击跳转下一页"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FourthRoute()));
              },
            ),
            Text(
              'Text常用的一些API',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 126, 90, 32),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

//          相当于一个布局组件
            Container(
              child: new Text(
                "这是一个测试",
                style:
                    TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent),
              ),
              width: 800.0,
              height: 200.0,
              color: Colors.lightBlueAccent,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是第二个页面"),
      ),
      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text("go back"),
//        ),
        child: Container(
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572174058370&di=cff6e2fa34f1174e8469352406261ad2&imgtype=0&src=http%3A%2F%2Fimg1.qunarzz.com%2Ftravel%2Fd9%2F1808%2F4e%2Fade70b8ed7b8d5b5.jpg',
//            fit: BoxFit.contain, // 设置图片显示的API 充满，宽高比，截取等等
            // 设置图片和颜色的混合
//            color: Colors.green,
//            colorBlendMode: BlendMode.darken,

            // 图片重复,横向重复 ImageRepeat.repeatX，纵向重复ImageRepeat.repeatY
            repeat: ImageRepeat.repeatX,
          ),
          width: 300.0,
          height: 200.0,
          decoration: new BoxDecoration(
              // 背景线性渐变
              gradient: const LinearGradient(colors: [
                Colors.lightBlue,
                Colors.greenAccent,
                Colors.purple
              ]),
              border: Border.all(width: 2.0, color: Colors.red)),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '这是第三个页面',
      home: Scaffold(
          // 脚手架
          appBar: AppBar(
            title: Text('导航栏'),
          ),
          // 垂直滚动的 ListView 默认方向
          body: ListView(
            children: <Widget>[
             /* ListTile(
                leading: Icon(Icons.access_alarms),
                title: Text('item2'),
              ),
              ListTile(
                leading: Icon(Icons.access_alarms),
                title: Text('item1'),
              )*/
             Image.network(
               'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3596358398,3523727167&fm=26&gp=0.jpg'
             ),
              Image.network(
                  'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2283009553,2748942395&fm=26&gp=0.jpg'
              )
            ],
          )),
    );
  }
}


class FourthRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "第四个页面",
      home: Scaffold(
        appBar: AppBar(
          title: Text("第四个页面"),
        ),
        body: Container(
          height: 100.0,
          child: MyList()
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          color: Colors.green,
          width: 90.0,
          child: Text('这是第一个item'),
        ),
        Container(
          color: Colors.red,
          width: 150.0,
          child: Text('这是第二个item'),
        ),
        Container(
          color: Colors.green,
          width: 50.0,
          child: Text('这是第三个item'),
        ),
        Container(
          color: Colors.deepPurpleAccent,
          width: 80.0,
          child: Text('这是第四个item'),
        ),
      ],
    );
  }
}