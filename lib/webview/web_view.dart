import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {

  final String url;
  final String title;

  const WebViewWidget({Key key, this.url,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
