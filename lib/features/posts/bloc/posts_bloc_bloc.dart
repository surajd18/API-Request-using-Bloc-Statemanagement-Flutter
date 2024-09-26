import 'dart:async';
import 'package:bloc_api/features/posts/models/post_model_ui.dart';

import 'package:bloc_api/features/posts/repos/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_bloc_event.dart';
part 'posts_bloc_state.dart';

class PostsBlocBloc extends Bloc<PostsBlocEvent, PostsBlocState> {
  PostsBlocBloc() : super(PostsBlocInitial()) {
    on<PostsInitialFecthEvent>(postsInitialFecthEvent);
  }

  FutureOr<void> postsInitialFecthEvent(
    PostsInitialFecthEvent event, Emitter<PostsBlocState> emit)async {

      emit(PostsFetchingLoadingState());


      List<PostDataModel> posts =await PostRepo.fetchposts();

      emit(PostsFecthedSuccessState(posts: posts));
      

  }
}
