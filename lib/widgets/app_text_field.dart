import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextStyle style;
  final String placeholder;
  final TextStyle hintStyle;
  final String prefixIcon;
  final TextEditingController textController;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final String? suffixIcon;
  final bool issuffixIcon;

  const AppTextField(
      {Key? key,
      required this.style,
      required this.placeholder,
      required this.hintStyle,
      required this.prefixIcon,
      required this.textController,
      required this.obscureText,
      required this.enableSuggestions,
      required this.autocorrect,
      this.suffixIcon,
      required this.issuffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(prefixIcon),
      const SizedBox(width: 21),
      Expanded(
        child: TextFormField(
          controller: textController,
          style: style,
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          autocorrect: autocorrect,
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: hintStyle,
              border: InputBorder.none),
        ),
      ),
      if (issuffixIcon == true) const SizedBox(width: 21),
      if (issuffixIcon == true) Image.asset(suffixIcon ?? "")
    ]);
  }
}
