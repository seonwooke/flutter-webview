import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InappwebviewPage extends StatefulWidget {
  const InappwebviewPage({super.key});

  @override
  State<InappwebviewPage> createState() => _InappwebviewPageState();
}

class _InappwebviewPageState extends State<InappwebviewPage> {
  late InAppWebViewController webViewcontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      title: const Text(
        "Inappwebview",
      ),
      centerTitle: true,
    );
  }

  _bodyWidget() {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(
          "https://github.com/seonwooke",
        ),
      ),
      onWebViewCreated: (controller) async {
        webViewcontroller = controller;
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        webViewcontroller.evaluateJavascript(
          source: '''
                    var navElement = document.querySelector('header');
                    if (navElement) {
                      navElement.style.display = 'none';
                    }
                  ''',
        );
        debugPrint('pass!!');
      },
    );
  }
}
