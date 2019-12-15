import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryTitleWidget extends StatelessWidget {

  _phoneClick() async {
    String url = 'tel:' + "18869998756";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url 不合法';
    }
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top; // 手机顶部状态栏的高度
    return  Container(
      padding: EdgeInsets.only(top: topPadding),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.wb_incandescent,
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
            onPressed: _phoneClick,
          ),
        ],
      ),
    );
  }
}
