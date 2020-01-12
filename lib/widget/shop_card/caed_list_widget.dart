import 'package:flutter/material.dart';
import 'package:flutter_app/bean/cart_bean.dart';
import 'package:flutter_app/eventBus/event_bus.dart';

class CartListWidget extends StatelessWidget {
  final List<CartBean> lists;

  const CartListWidget({Key key, this.lists}) : super(key: key);

  Widget _itemWidget(CartBean mCartBean,int position) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: mCartBean.isChecked, // 复选框的值
            activeColor: Colors.blue, // 选中时的颜色
            onChanged: (bool cheked) {
              mCartBean.isChecked = !mCartBean.isChecked;
              // TODO 发送 EventBus 订阅消息去修改（刷新）数据
              eventBus.fire(CenterEvent('is_selected',position));
            },
          ),
          Image.network(
            mCartBean.image,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(mCartBean.title),
                SizedBox(
                  height: 6,
                ),
                Text(mCartBean.content),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "images/reduce_card.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                    child: TextField(
//                  controller: typeController, // 监听文本字段变化
                      autofocus: false, // 获取焦点
                      // 装饰
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(3, 0, 0, 0),
//                        hintText: '请输入内容',
//                        labelText: '大家好', // 悬浮提示，可代替hintText
//                        helperText: '请输入你需要的内容', // 帮助文字
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "images/add_card.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      child: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return _itemWidget(lists[index],index);
        },
      ),
    );
  }
}
