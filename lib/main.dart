import 'package:bloc_api/features/posts/ui/posts_page.dart';
import 'package:flutter/material.dart';

import 'features/home/home_page.dart';


void main() async{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
    );
  }
}