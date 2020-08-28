import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kortobaa_task/src/blocs/post/post_bloc.dart';
import 'package:flutter_kortobaa_task/src/models/post_model.dart';
import 'package:flutter_kortobaa_task/src/utils/permessions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddPostDialog extends StatefulWidget {

  @override
  _AddPostDialogState createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  TextEditingController _textEditingController=TextEditingController();

  File _image;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return OrientationBuilder(
      builder: (ctx, orientation) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(15.w),
          contentPadding: EdgeInsets.all(15.w),
          content: SingleChildScrollView(
            child: Container(
              height: orientation == Orientation.portrait?0.5.hp : 0.8.hp,
              width: MediaQuery.of(context).size.width,
              child: Column(

                children: <Widget>[
                  Expanded(
                    flex: orientation == Orientation.portrait?3 : 2,
                    child: GestureDetector(
                      onTap:(){
                       pickImage();

                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.3),
                        height: 0.5.wp,
                        width: MediaQuery.of(context).size.width,
                        child: _image == null
                            ? _uploadPhotoContainer()
                            : Image.file(_image,fit: BoxFit.fill,),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
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
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<PostBloc>(context).add(AddPost(PostModel(userName: "from device",content: _textEditingController.text,isFromDevice: true,file: _image)));
                              Navigator.pop(context);
                            },
                            child: Card(
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
                          ),
                          SizedBox(width: 20.w,),

                          GestureDetector(
                            onTap: (){
                              print("object");
                              Navigator.of(context).pop();
                            },
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
        );
      }
    );
  }

  Widget _uploadPhotoContainer(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.camera_alt,
          color: Colors.grey.withOpacity(0.5),
          size: 40,
        ),
        Text(
          'Upload photo',
          style: TextStyle(color: Colors.grey.withOpacity(0.5)),
        )
      ],
    );
  }

  Future pickImage() async{

    // permession check  use in real device
   // await statusStorge();

    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery).whenComplete((){
    }
    );
    setState(() {
      _image = image;
    });
  }

}
