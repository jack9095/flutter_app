import 'package:flutter/material.dart';
import 'package:flutter_app/bean/home_list_bean.dart';

class HomeItemView extends StatelessWidget {

  final HomeListBean mHomeListBean;

  const HomeItemView({Key key, this.mHomeListBean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            child: Image.network(mHomeListBean.imageUrl),
            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
          ),
          Column(
            children: <Widget>[
              Text(mHomeListBean.titleT),
              Text(mHomeListBean.desc),
            ],
          ),
        ],
      ),
    );
  }
}
