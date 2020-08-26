import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/models/post_model.dart';
import 'package:flutter_kortobaa_task/src/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItem extends StatelessWidget {

  PostModel _postModel;

  PostItem(this._postModel);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);

    return Card(
      margin: EdgeInsets.all(20.sp),
      child: Column(
        children: <Widget>[
          _headRow(),

          Padding(
            padding:  EdgeInsets.symmetric(vertical: 40.sp),
            child: Container(
              height: 600.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                _postModel.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w,vertical: 30.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                _postModel.content,
                textDirection: TextDirection.rtl,

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headRow(){
    return Theme(
      data: rowCardTheme,
      child: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.turned_in),
                  Icon(Icons.share),
                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    _postModel.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
