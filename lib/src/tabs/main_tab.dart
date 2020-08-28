
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kortobaa_task/src/blocs/post/post_bloc.dart';
import 'package:flutter_kortobaa_task/src/dialogs/add_post_dialog.dart';
import 'package:flutter_kortobaa_task/src/items/post_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPosts();

  }
  void loadPosts() async{
    BlocProvider.of<PostBloc>(context).add(LoadPosts());

  }

  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          child: Stack(
            children: <Widget>[
              BlocBuilder<PostBloc,PostState>(
                builder: (context, stat) {
                  //print(stat);
                  if (stat is PostLoaded) {
                    return ListView(
                      children: <Widget>[
                        ListView.builder(
                          itemBuilder: (context,index)=>PostItem(stat.posts[index],orientation),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: stat.posts.length,
                        ),

                        Visibility(
                          child: CircularProgressIndicator(),
                          visible: stat is PostLoading? true : false,
                        ),
                      ],
                    );
                  }  else{
                    return Center(child: CircularProgressIndicator());
                  }
                }
              ),

              Positioned(
                child: FloatingActionButton(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () async{
                    await _dialogCall(context);
                  }
                  ,
                ),
                bottom: 30.h,
                right: 20.w,
              ),
            ],
          ),
        );
      }
    );
  }




  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return BlocProvider.value(
            value: BlocProvider.of<PostBloc>(context),
              child: AddPostDialog()
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

