import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/pages/home_page.dart';
import 'package:flutter_kortobaa_task/src/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



