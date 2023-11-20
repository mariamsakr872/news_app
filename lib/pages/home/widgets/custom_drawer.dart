import 'package:flutter/material.dart';
import 'package:news_app/pages/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCategoryClicked;
  const CustomDrawer({super.key,required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width * 0.7,
            height: mediaQuery.height * 0.15,
            color: theme.primaryColor,
            child: Text(
             "${locale!.news_app}!",
              style: theme.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                onCategoryClicked();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_outlined,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    locale.categories,
                    style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, SettingView.routeName);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    locale.settings,
                    style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
