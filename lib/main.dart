import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  /// [flutter_inappwebview] 설정
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
