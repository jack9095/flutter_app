import 'package:flutter/material.dart';
import 'package:flutter_app/bean/home_list_bean.dart';
import 'package:flutter_app/webview/web_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItemView extends StatelessWidget {

  final HomeListBean mHomeListBean;

  const HomeItemView({Key key, this.mHomeListBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child:GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewWidget(url:'https://www.baidu.com/',title: mHomeListBean.titleT,)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // 主轴也就是父布局（Row）的方向
          children: <Widget>[
            Padding(
              child: Image.network(mHomeListBean.imageUrl), padding: EdgeInsets.fromLTRB(15, 6, 10, 6),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        mHomeListBean.titleT,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Text(
                        mHomeListBean.desc,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black38
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
