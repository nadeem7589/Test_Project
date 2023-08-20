import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';
class PostsRepository {

  String url="https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> getPosts() async{
   http.Response response= await http.get(Uri.parse(url)) ;

   if(response.statusCode==200){
     final List posts=jsonDecode(response.body);
     return posts.map((e) => PostModel.fromJson(e)).toList();
   }else{
     throw Exception(response.reasonPhrase);
   }
  }

}