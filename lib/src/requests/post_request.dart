
import 'package:flutter_kortobaa_task/src/models/post_model.dart';

Future<List<PostModel>> mock_post_request() async{
  List<PostModel> list= [];
 await Future.delayed(Duration(seconds: 2));

  list.add(PostModel(
    content: "هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة , هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة",
    imagePath: "assets/imgs/img1.jpg",
    userName: "اسم المستخدم",
    file: null,
    isFromDevice: false
  ));

  list.add(PostModel(
    content: "this content text",
    imagePath: "assets/imgs/img2.jpg",
    userName: "اسم المستخدم",
      file: null,
      isFromDevice: false
  ));

  list.add(PostModel(
    content: "this content text",
    imagePath: "assets/imgs/img3.jpg",
    userName: "اسم المستخدم",
      file: null,
      isFromDevice: false
  ));

  return list;
}