import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({Key? key, required this.url}) : super(key: key);
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebView(initialUrl: url)),
    );
  }
}
