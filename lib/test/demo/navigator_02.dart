import 'package:flutter/material.dart';

// 构建一个商品实体
class Product {
  final String title; // 标题
  final String description; // 描述
  Product(this.title, this.description);
}

// 构建一个商品列表
void main() {
  runApp(MaterialApp(
    title: '导航传递数据演示',
    home: ProductList(
      prodects: List.generate(20, (x) => Product("这是商品$x",'商品描述$x')
      ),
    ),
  ));
}

class ProductList extends StatelessWidget {
  List<Product> prodects;

  ProductList({Key key,@required this.prodects}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表'),),
      body: ListView.builder(
        itemCount: prodects.length,
          itemBuilder: (context,position){
           return ListTile(
              title: Text('这是商品${prodects[position].title}'),
             onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(index: prodects[position],)));
             },
           );
          }
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {

  Product index;

  ProductDetails({Key key,this.index}): super(key: key);

  @override
  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.lightBlue,
//      alignment: FractionalOffset(0.5, 0.5),
//      child: Text('商品$index的详情'),
//    );

  return Scaffold(
    appBar: AppBar(title: Text('${index.title}'),),
    body: Center(
      child: Text("${index.description}"),
    ),
  );
  }
}

