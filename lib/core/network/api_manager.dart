import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/constant/constant.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/models/source_model.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String categoryId) async {
    var query = {
      "apiKey": Constant.apiKey,
      "category": categoryId,
    };

    var uri = Uri.https(
      Constant.baseUrl,
      "/v2/top-headlines/sources",
      query,
    );
    var response = await http.get(uri);

    var sourceData = SourceModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200 && jsonDecode(response.body)["status"] == "ok") {
      return sourceData;
    }
    else {
      throw Exception("failed to get sources");
    }

  }

  static Future<ArticleModel> fetchArticles ({String? source, String? queue}) async{

    var query = {
      "apiKey": Constant.apiKey,
      "sources": source,
      "q" : queue

    };

    var uri = Uri.https(
      Constant.baseUrl,
      "/v2/everything",
      query,
    );

    var response = await http.get(uri);

    var articleData = ArticleModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200 && jsonDecode(response.body)["status"] == "ok") {
      return articleData;
    }
    else {
      throw Exception("failed to get articles");
    }
  }


}
