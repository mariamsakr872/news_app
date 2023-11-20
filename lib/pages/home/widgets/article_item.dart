import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/time_different.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/pages/home/widgets/article_details.dart';

class ArticleItem extends StatelessWidget {
  final Articles article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ArticleDetails.routeName,arguments: article);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                article.source?.name ?? "",
                style: theme.textTheme.bodySmall?.copyWith(color: const Color(0xFF79828B)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(article.title ?? "",style: theme.textTheme.bodyMedium,),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
               " ${TimeDifferent.getDifference(article)}",
                textAlign: TextAlign.end,
                style: theme.textTheme.bodySmall?.copyWith(color:const Color(0xFF79828B)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
