import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/pages/settings/widget/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../app_provider.dart';

class SettingView extends StatelessWidget {
  static const String routeName = "setting";

  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    var appProvider = Provider.of<AppProvider>(context);
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
            locale!.settings,
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Text(
                locale.language,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: theme.primaryColor,
                      width: 1.3,
                      style: BorderStyle.solid)),
              child: GestureDetector(
                onTap: () {
                  onLanguageClicked(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      appProvider.currentLocale == "en"? "English" : "عربي",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.primaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 20,
                      color: theme.primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onLanguageClicked(context) {
    showModalBottomSheet(context: context, builder: (context) => const LanguageBottomSheet(),);
  }
}
