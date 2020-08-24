
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              onPressed: ()=> _showDialogAddPost(context)
             ,
            ),
            bottom: 30.h,
            right: 20.w,
          ),
        ],
      ),
    );
  }

  TextEditingController _textEditingController=TextEditingController();

  void _showDialogAddPost(BuildContext ctx){
    showDialog(
      context: ctx,
        builder: (context)=>Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  margin: EdgeInsets.all(10.sp),
                  height: 300.h,
                  width: MediaQuery.of(context).size.width,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                    size: 150.sp,
                  ),
                ),

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _textEditingController,
                    onChanged: _onChangedTextField,
                    keyboardType: TextInputType.multiline,
                    maxLines:2,
                    maxLength: 120,
                    decoration: InputDecoration(
                      labelText: "اكتب تعليقا حول الصورة"
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 30.h),
                  child: Row(
                    children: <Widget>[
                      Card(
                        color: Colors.teal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80.w,vertical: 20.h),
                          child: Text(
                            'نشر',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                            'تجاهل',
                             style: TextStyle(
                               color: Colors.grey
                             ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }

  void _onChangedTextField(String text){

  }
}
