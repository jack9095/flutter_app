import 'package:flutter/material.dart';



// 构建一个商品列表
void main() {
  runApp(MaterialApp(
    title: '页面跳转返回数据',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('去巡捕房要人'),),
      body: Center(
        child: CustomButton(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('去巡捕房'),
      onPressed: (){
        _customRouter(context);
      },
    );
  }

  // 内部方法前面一般都加下划线  这里使用了异步
  _customRouter(BuildContext context) async{

    // 异步等候返回结果
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => XunPuFang()));

    // 使用 SnackBar
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class XunPuFang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("这里是巡捕房"),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('这是熊大'),
            onPressed: (){
              Navigator.pop(context,'熊大：18268987809');
            },
          ),
          RaisedButton(
            child: Text('这是熊二'),
            onPressed: (){
              Navigator.pop(context,'熊二：15267879876');
            },
          ),
        ],
      ),
    );
  }
}




