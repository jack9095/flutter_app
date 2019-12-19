import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final List<Map> lists;

  const ServiceWidget({Key key, this.lists}) : super(key: key);

  Widget _serviceView(image, title) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image,
            height: 30,
            width: 40,),
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5.0),
        bottomRight: Radius.circular(5.0),
      )),
      child: GridView.count(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
        crossAxisCount: 4,
        children: lists.map((item) {
          return _serviceView(item['image'], item['title']);
        }).toList(),
      ),
    );
  }
}
