import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTab extends StatelessWidget {
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
              onPressed: _showDialogAddPost,
            ),
            bottom: 30.h,
            right: 20.w,
          ),
        ],
      ),
    );
  }

  void _showDialogAddPost(){
    showDialog(context: null);
  }
}
