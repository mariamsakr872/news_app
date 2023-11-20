import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/models/article_model.dart';

import '../../../core/network/api_manager.dart';
import 'article_item.dart';

class OpenSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        //app bar color I wanted
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );



  @override
  List<Widget>? buildActions(BuildContext context) {
    var theme = Theme.of(context);
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 30,
            color: theme.primaryColor,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    var theme = Theme.of(context);
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.clear_rounded,
          size: 30,
          color: theme.primaryColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover,
          )),
      child: FutureBuilder<ArticleModel>(
          future: ApiManager.fetchArticles(queue: query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Articles> articlesList = snapshot.data?.articles ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) =>
                  ArticleItem(article: articlesList[index]),
              itemCount: articlesList.length,
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: null,
      color: Colors.white,
    );
  }
}
