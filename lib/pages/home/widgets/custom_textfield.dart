import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? label;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Widget? icon;
  final Color? color;
  final bool obscure;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    this.title,
    this.label,
    this.validator,
    this.maxLines = 1,
    this.icon,
    this.color,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: title,
          labelText: label,
          suffixIcon: icon,
          suffixIconColor: color,
          hintStyle: theme.textTheme.bodyMedium
              ?.copyWith(color: Colors.black),
          labelStyle: theme.textTheme.bodyLarge
              ?.copyWith(color: Colors.black),

          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          ))),
      style: const TextStyle(color:Colors.black),
    );
  }
}
