import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/utils/hexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appThemeData(BuildContext context){
  ScreenUtil.init(context);
  return ThemeData(
    primaryColor: HexColor('#bddfdc'),

    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white,
        )
    ),

    indicatorColor: Colors.white,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(50,allowFontScalingSelf: true),
      ),
    ),
  );
}