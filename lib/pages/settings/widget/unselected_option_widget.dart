import 'package:flutter/material.dart';

class UnselectedOption extends StatelessWidget {
  final String title;
  const UnselectedOption({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Text(
          title,
          style: const TextStyle(color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
        ));
  }
}
