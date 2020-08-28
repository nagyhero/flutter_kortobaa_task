import 'dart:io';

class PostModel{
  String imagePath;
  String content;
  String userName;
  bool isFromDevice = false;
  File file;

  PostModel({this.imagePath, this.content, this.userName,this.isFromDevice,this.file});
}