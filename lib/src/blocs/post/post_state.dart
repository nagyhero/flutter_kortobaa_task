part of 'post_bloc.dart';

@immutable
 class PostState {
  List<PostModel> posts=[];

  PostState._();
  PostState({this.posts});

  factory PostState.initial(){
   return PostState._()..posts = [];
  }
}

class InitialPostState extends PostState {}

class PostLoading extends PostState{

}


class PostLoaded extends PostState{

 List<PostModel> posts=[];

 PostLoaded(this.posts);
}