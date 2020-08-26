
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kortobaa_task/src/blocs/post/post_bloc.dart';
import 'package:flutter_kortobaa_task/src/items/post_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with AutomaticKeepAliveClientMixin {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   
  }

  ScrollController _scrollController= ScrollController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    BlocProvider.of<PostBloc>(context).add(LoadPosts());
    return Container(
      child: Stack(
        children: <Widget>[

          BlocBuilder<PostBloc,PostState>(
            cubit: BlocProvider.of<PostBloc>(context),
            builder: (context, state) {
              return NotificationListener(
                onNotification: (t) {
                  if (t is ScrollEndNotification) {
                    BlocProvider.of<PostBloc>(context).add(LoadPosts());                  }
                },
                child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    ListView.builder(
                      itemBuilder: (context,index)=>PostItem(state.posts[index]),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.posts.length,
                    ),

                    Visibility(
                      child: CircularProgressIndicator(),
                      visible: state is PostLoading? true : false,
                    ),
                  ],
                ),
              );
            }
          ),

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
          insetPadding: EdgeInsets.all(15.w),
          child: Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:  EdgeInsets.all(20.sp),
              child: Column(

                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 300.h,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera_alt,
                            color: Colors.grey.withOpacity(0.5),
                            size: 150.sp,
                          ),
                          Text(
                              'Upload photo',
                            style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        controller: _textEditingController,
                        keyboardType: TextInputType.multiline,
                        maxLines:2,
                        maxLength: 120,
                        decoration: InputDecoration(
                          labelText: "اكتب تعليقا حول الصورة"
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
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

                          GestureDetector(
                            onTap: ()=>Navigator.of(context).pop(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                  'تجاهل',
                                   style: TextStyle(
                                     color: Colors.grey
                                   ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
