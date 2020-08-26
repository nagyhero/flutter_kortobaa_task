import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/utils/hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appThemeData(BuildContext context){
  ScreenUtil.init(context);
  return ThemeData(
    primaryColor: HexColor('#bddfdc'),

    fontFamily: 'Cairo',

    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.white,
        )
    ),

    indicatorColor: Colors.white,

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.grey
      )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
    ),

    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(60,allowFontScalingSelf: true),
      ),
    ),
  );

}

ThemeData rowCardTheme = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.grey,
  ),
);