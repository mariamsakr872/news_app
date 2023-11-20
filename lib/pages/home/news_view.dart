import 'package:flutter/material.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/pages/home/widgets/news_details_view.dart';

class NewsView extends StatelessWidget {
  final CategoryModel categoryModel;

  const NewsView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return NewsDetailsView(categoryModel: categoryModel);
  }
}
