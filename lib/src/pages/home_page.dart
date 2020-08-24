import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/tabs/main_tab.dart';
import 'package:flutter_kortobaa_task/src/tabs/profile_tab.dart';
import 'package:flutter_kortobaa_task/src/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Theme(
      data: appThemeData(context),
      child: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(

              tabs: <Widget>[
                Text('حسابي'),
                Text('الرئيسية'),

              ],
            ),
          ),
          endDrawer: _drawer,

          body: TabBarView(
            children: <Widget>[
              ProfileTab(),
              MainTab(),
            ],
          ),

        ),
      ),
    );
  }

  Drawer _drawer = Drawer(

  );
}
