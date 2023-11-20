import 'package:flutter/material.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/network/api_manager.dart';

import '../../core/models/source_model.dart';

class HomeViewModel extends ChangeNotifier {

  int selectedIndex = 0;

   List<Source> _sourcesList = [];
  List<Source> get sourcesList => _sourcesList;

   List<Articles> _articlesList = [];
   List<Articles> get articlesList => _articlesList;

   changeIndex(int index) {
     selectedIndex = index;
     notifyListeners();
   }
  Future<bool> getSources(String categoryId) async {
    var response = await ApiManager.fetchSources(categoryId);
    try {
      if(response.status == "ok") {
        _sourcesList = response.sources!;
        notifyListeners();
        return Future.value(true);
      }
      else {
        return Future.value(false);
        // display error message
      }
    }
    catch (e) {
      print(e.toString());
      return Future.value(false);
    }

  }

  Future<bool> getArticles (String source) async {
    var response = await ApiManager.fetchArticles(source: source);
    try {
      if(response.status == "ok") {
        _articlesList = response.articles!;
        notifyListeners();
        return Future.value(true);
      }
      else {
        return Future.value(false);
        // display error message
      }
    }
    catch (e) {
      print(e.toString());
      return Future.value(false);
    }


  }
}