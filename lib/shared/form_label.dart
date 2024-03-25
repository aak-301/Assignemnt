import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const FormLabel({
    super.key,
    required this.text,
    this.padding = const EdgeInsets.only(bottom: 10),
    this.textColor = const Color(0xff434657),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding!,
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
