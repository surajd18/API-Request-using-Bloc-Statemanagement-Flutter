part of 'posts_bloc_bloc.dart';

@immutable
abstract class PostsBlocState {}

abstract class PostActionState extends PostsBlocState{}

final class PostsBlocInitial extends PostsBlocState {}

final class PostsFetchingLoadingState extends PostsBlocState{}

final class PostFetchingErrorState extends PostsBlocState{}

final class PostsFecthedSuccessState extends PostsBlocState{
  final List<PostDataModel> posts;

  PostsFecthedSuccessState({required this.posts});
}
