import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_kortobaa_task/src/models/post_model.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(null);

  @override
  PostState get initialState => InitialPostState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: Add your event logic
  }
}
