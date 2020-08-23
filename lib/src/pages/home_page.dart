import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/tabs/main_tab.dart';
import 'package:flutter_kortobaa_task/src/tabs/profile_tab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: _drawer,
        body: TabBarView(
          children: <Widget>[
            MainTab(),
            ProfileTab(),
          ],
        ),

      ),
    );
  }

  Drawer _drawer = Drawer(

  );
}
