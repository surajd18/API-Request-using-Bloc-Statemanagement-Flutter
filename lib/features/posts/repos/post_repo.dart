import 'dart:convert';
import 'package:bloc_api/features/posts/models/post_model_ui.dart';
import 'package:http/http.dart' as http;

class PostRepo{

  static Future<List<PostDataModel>> fetchposts() async{
    var client =http.Client();
      List<PostDataModel> posts =[];

      try{

          var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

          List result = jsonDecode(response.body);
          
          for(int i=0;i<result.length;i++)
          {
            PostDataModel post =PostDataModel.fromMap(result[i] as Map<String,dynamic>);
            posts.add(post);
          }
          return posts;

      }catch(e)
      {
        
        throw(e.toString());
      }
  }
}