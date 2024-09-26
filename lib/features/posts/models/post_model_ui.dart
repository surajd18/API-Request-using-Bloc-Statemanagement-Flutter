// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostDataModel {

  final int userId;
  final int id;
  final String title;
  final String body;

  PostDataModel({
    required this.userId, 
    required this.id,
     required this.title, 
     required this.body});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostDataModel.fromMap(Map<String, dynamic> map) {
    return PostDataModel(
      userId: (map["userId"] ?? 0) as int,
      id: (map["id"] ?? 0) as int,
      title: (map["title"] ?? '') as String,
      body: (map["body"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostDataModel.fromJson(String source) => PostDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

