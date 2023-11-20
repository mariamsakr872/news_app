import 'package:flutter/material.dart';
import 'package:news_app/pages/settings/widget/selected_option_widget.dart';
import 'package:news_app/pages/settings/widget/unselected_option_widget.dart';
import 'package:provider/provider.dart';

import '../../../app_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("en");
                Navigator.of(context).pop();
              },
              child: appProvider.currentLocale == "en"
                  ? const SelectedOption(title: "English")
                  : const UnselectedOption(title: "English")),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
              onTap: () {
                appProvider.changeLanguage("ar");
                Navigator.of(context).pop();
              },
              child: appProvider.currentLocale == "en"
                  ? const UnselectedOption(title: "عربي")
                  : const SelectedOption(title: "عربي")),
        ],
      ),
    );
  }
}
