import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/constant/time_different.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/article_model.dart';

class ArticleDetails extends StatefulWidget {
  static const String routeName = "articleDetails";

  const ArticleDetails({super.key});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/pattern.png",
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            locale!.title,
            style: theme.textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: args.urlToImage ?? "",
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  args.source!.name!,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: const Color(0xFF79828B)),
                ),
                Text(args.title!,style: const TextStyle(
                  fontSize: 19,
                  color: Color(0xFF42505C)
                ),),
                Text(
                  TimeDifferent.getDifference(args),
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: const Color(0xFF79828B)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          args.description!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                              color: const Color(0xFF79828B)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(onPressed: () {
                        openUrl(args.url);
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "View full article",
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color:  Colors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.arrow_forward_rounded,size: 18,color: Colors.black,)
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

   openUrl(String? url) async {
    if(url == null) {
      return;
    }

    var uri = Uri.parse(url);
   if(await canLaunchUrl(uri)) {
     launchUrl(uri);
   }


  }
}
