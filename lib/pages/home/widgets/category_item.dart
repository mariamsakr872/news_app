import 'package:flutter/material.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../../app_provider.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final Function onItemClick;

  const CategoryItem(
      {super.key,
      required this.categoryModel,
      required this.index,
      required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return GestureDetector(
      onTap: () {
        onItemClick(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.categoryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: (appProvider.currentLocale == "en")
                  ? (index % 2 == 0)
                      ? const Radius.circular(25.0)
                      : const Radius.circular(0.0)
                  : (index % 2 == 0)
                      ? const Radius.circular(0.0)
                      : const Radius.circular(25.0),
              bottomRight: (appProvider.currentLocale == "en")
                  ? (index % 2 == 0)
                      ? const Radius.circular(0.0)
                      : const Radius.circular(25.0)
                  : (index % 2 == 0)
                      ? const Radius.circular(25.0)
                      : const Radius.circular(0.0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.categoryImage),
            Text(
              categoryModel.categoryTitle,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
