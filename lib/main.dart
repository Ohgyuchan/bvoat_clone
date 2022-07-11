import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.instance.light(),
      home: const HomePage(),
    );
  }
}
