import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_kortobaa_task/src/models/post_model.dart';
import 'package:flutter_kortobaa_task/src/requests/post_request.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState.initial());

  @override
  PostState get initialState => PostState.initial();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<PostModel> list = state.posts;
    if (event is LoadPosts) {
      yield PostLoading();
      List<PostModel> newList = await mock_post_request();
      list.addAll(newList);
      yield PostState(posts: list);
    }
  }
}
