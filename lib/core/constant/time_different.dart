import 'package:news_app/core/models/article_model.dart';

class TimeDifferent {
  static String getDifference (Articles article) {
    DateTime? date1 = DateTime.parse(article.publishedAt!);
    DateTime date2 = DateTime.now();

    Duration diff = date2.difference(date1);


    if(diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    }
    return "${diff.inDays} days ago";

  }
}