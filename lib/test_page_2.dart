import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WEBVIEW"),
      ),
      body: WebViewX(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        initialSourceType: SourceType.url,
        onWebViewCreated: (con){
          con.loadContent("http://localhost:8010/",
              SourceType.url);
        },
      ),
    );
  }
}
