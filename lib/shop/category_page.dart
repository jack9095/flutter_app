import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = size.width; // 屏幕宽度
    double height = size.height; // 屏幕高度
    double topPadding = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        Container(
          height: topPadding,
        ),
//        Divider(height: topPadding,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
//              onPressed: () => Navigator.pop(context),
            ),
            Text(
              '分类',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),

        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Color.fromARGB(255, 244, 244, 244),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: GridView.builder(
              shrinkWrap: true,  // 这个必须得设置， 否则不显示
//              physics: NeverScrollableScrollPhysics(), // 禁止滑动
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7
              ),
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
