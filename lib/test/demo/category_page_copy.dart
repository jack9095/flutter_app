import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width; // 屏幕宽度
    final height = size.height; // 屏幕高度
    //    return SingleChildScrollView(  // 可以防止高度不够提示越界的错误
//      child: Text(
//        '分类',
//        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
//      ),
//    );
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                child: Text(
                  '分类',
                ),
                margin: EdgeInsets.fromLTRB(width / 2 - 7, 34.0, 0, 0),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 30.0, 15.0, 0),
                child: Icon(CupertinoIcons.search),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                height: 0.5,
                color: Color.fromARGB(255, 234, 233, 234),
              ),
            ),
          ],
        ),

        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Color.fromARGB(255, 244, 244, 244),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//            child: Container(
//              color: Colors.blue,
//            ),
            child: GridView.builder(
              shrinkWrap: true,  // 这个必须得设置， 否则不显示
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7
              ),
              itemCount: 12,
              itemBuilder: (context,index){
                return FlatButton(
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: (){

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(CupertinoIcons.folder_solid),
                      ),
                      Expanded(
                        child: Text('家电'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

      ],
    );
  }
}
