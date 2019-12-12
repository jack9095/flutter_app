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
      title: "第四个页面",
      home: Scaffold(
        appBar: AppBar(
          title: Text("第四个页面"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${items[index]}'),
              );
            }),
      ),
    );
  }
}
