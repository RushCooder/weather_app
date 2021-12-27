import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String title;
  final bool isBold;
  final double fontSize;
  TextComponent(
      {required this.title,
      this.isBold = false,
      this.fontSize = 18.0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      ),
    );
  }
}
