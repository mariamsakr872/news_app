import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_model.dart';

class TabItem extends StatelessWidget {
  final Source source;
  final bool isSelected;

  const TabItem({super.key, required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(

        color: isSelected? theme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
              color: theme.primaryColor, width: 1.3, style: BorderStyle.solid)),
      child: Text(
        source.name!,
        style: TextStyle(
          color: isSelected? Colors.white : theme.primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
