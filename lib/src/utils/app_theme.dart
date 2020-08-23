import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/utils/hexColor.dart';

final appThemeData = ThemeData(
  primaryColor: HexColor('#bddfdc') ,

  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white
    )
  ),


  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    labelStyle: TextStyle(
      fontSize: 20,
    ),
  ),

  
);