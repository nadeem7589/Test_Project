import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../data/api/data.dart';
import '../data/model/post_model.dart';

class PageViewModel extends ChangeNotifier{

  PostsRepository postsRepository=PostsRepository();

  List<PostModel> postList=[];
  List<PostModel> reversedList=[];





  /// function to call api
  getPost()async{

    postList=await postsRepository.getPosts();

    for (var element in postList) {
      reversedList.insert(0, element);
    }
    notifyListeners();

  }


  /// Reverse list

  bool? reverseList=false;

  reverseListFunction()async{
    if(reverseList==true){
      reverseList=false;
    }else{
      reverseList=true;
    }
    notifyListeners();
  }




  /// filter list with title


  List<PostModel> resultList=[];
  filterList(String value){
    resultList.clear();
    if(value.isEmpty){
      notifyListeners();
      return;
    }

    if(reverseList==true){
      for (var element in reversedList) {
        if(element.title!.contains(value)){
          resultList.add(element);
          notifyListeners();
        }
      }

    }else{
      for (var element in postList) {
        if(element.title!.contains(value)){
          resultList.add(element);
          notifyListeners();
        }
      }


    }



  }


}