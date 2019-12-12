import 'package:flutter/material.dart';
import '../route/index.dart';

void main() => runApp(RouteWidget());

class RouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由的简单使用',
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false, // 去掉右上角的 DEBUG
      routes: {
        'lv_widgets': (context) => ListViewDemo(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "路由的简单使用",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: TESTS.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return FlatButton(
              onPressed: () {
                  Navigator.pushNamed(context, TESTS[index].routeName);
              },
              color: COLORS[index % COLORS.length],
              // 圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        TESTS[index].title,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        TESTS[index].desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

const TESTS = [
  Test(
    title: 'ListView',
    desc: 'itemBuild',
    routeName: 'lv_widgets',
  ),
  Test(
    title: 'GridView',
    desc: 'itemBuild',
    routeName: 'gv_widgets',
  ),
  Test(
    title: 'NetWork',
    desc: 'itemBuild',
    routeName: 'nw_widgets',
  ),
];

class Test {
  final String title;
  final String desc;
  final String routeName;

  const Test({this.title, this.desc, this.routeName});
}

const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];
