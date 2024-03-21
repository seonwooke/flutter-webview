import 'package:flutter/material.dart';

import 'inappwebview_page.dart';
import 'webview_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InappwebviewPage(),
                  ),
                );
              },
              child: const Text(
                'FAQ (Inappwebview)',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebviewPage(),
                  ),
                );
              },
              child: const Text(
                'FAQ (Webview)',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
