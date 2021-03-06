import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kortobaa_task/src/pages/home_page.dart';
import 'package:flutter_kortobaa_task/src/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/blocs/post/post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context)=>PostBloc(),
          child: HomePage()
      ),
    );
  }
}



