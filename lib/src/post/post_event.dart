part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class LoadPosts extends PostEvent{

}

class AddPost extends PostEvent{
  PostModel postModel;

  AddPost(this.postModel);
}
