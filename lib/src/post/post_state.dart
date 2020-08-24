part of 'post_bloc.dart';

@immutable
abstract class PostState {
  List<PostModel> posts;

  PostState._();

  PostState({this.posts});
}

class InitialPostState extends PostState {}

class PostLoading extends PostState{

}

class PostLoaded extends PostState{

}