import 'package:bloc_api/features/posts/bloc/posts_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostsBlocBloc postsBlocBloc = PostsBlocBloc();

  @override
  void initState() {
    // TODO: implement initState
    postsBlocBloc.add(PostsInitialFecthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber[100],
          title: Center(child: Text("Posts"))),
      body: BlocConsumer<PostsBlocBloc, PostsBlocState>(
          bloc:postsBlocBloc,
          listenWhen: (previous, current) => current is PostActionState,
          buildWhen: (previous, current) => current is !PostActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch(state.runtimeType){
              case PostsFetchingLoadingState:
              return const Center(child: CircularProgressIndicator(),);
              
              case PostsFecthedSuccessState:
              final successState = state as PostsFecthedSuccessState;

              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder:(context, index) {
                    return Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(successState.posts[index].title),
                          Text(successState.posts[index].body)
                      ]),
                    );
                  }, ),
              );
              default:
              return const SizedBox();
            }
          }),
    );
  }
}
