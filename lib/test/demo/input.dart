import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '这是一个demo',
    home: PageWidget(),
  ));
}

class PageWidget extends StatefulWidget {
  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎使用输入组件';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input 输入组件'),
        centerTitle: true,
      ),
      body: Container(
        height: 1000,
        child: Column(
          children: <Widget>[
            TextField(
              controller: typeController, // 监听文本字段变化
              autofocus: true, // 获取焦点
              // 装饰
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                hintText: '请输入内容',
                labelText: '大家好', // 悬浮提示，可代替hintText
                helperText: '请输入你需要的内容', // 帮助文字
              ),
            ),
            Text(
              showText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RaisedButton(
              onPressed: _ClickFunction,
              child: Text('点击获取值'),
            ),
          ],
        ),
      ),
    );
  }

  void _ClickFunction(){
    print('开始输入内容');
    if(typeController.text.toString() == ""){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('输入的内容不能为空'),)
      );
    } else {
      setState(() {
        showText = typeController.text.toString();
      });
    }
  }
}
