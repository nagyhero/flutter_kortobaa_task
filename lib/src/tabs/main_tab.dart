
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: (){
                _showDialogAddPost(context);
              },
            ),
            bottom: 30.h,
            right: 20.w,
          ),
        ],
      ),
    );
  }

  void _showDialogAddPost(BuildContext ctx){
    showDialog(
      context: ctx,
        builder: (context)=>AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
          ),
        ),

    );
  }
}
