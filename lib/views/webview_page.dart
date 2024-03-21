import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final webViewController = WebViewController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) async {
            debugPrint('progressing $progress');
          },
          onPageStarted: (String url) async {
            debugPrint(url);
          },
          onPageFinished: (String url) async {
            await Future.delayed(
              const Duration(
                seconds: 1,
              ),
            );
            webViewController.runJavaScript(
              '''
                var navElement = document.querySelector('header');
                if (navElement) {
                  navElement.style.display = 'none';
                }
              ''',
            );
            isLoading = false;
            setState(() {});
            debugPrint('Page Finished');
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse("https://github.com/seonwooke"));
  }

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
        "Webview",
      ),
      centerTitle: true,
    );
  }

  _bodyWidget() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : WebViewWidget(
            controller: webViewController,
          );
  }
}
