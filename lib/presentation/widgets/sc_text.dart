import 'package:flutter/material.dart';
import 'package:skill_core/config/constants.dart';

class ScText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final EdgeInsets? padding;
  final String fontFamily;

  const ScText(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.color,
    this.padding,
    this.fontFamily = robotoFont,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: TextStyle(
          // fontFamily: fontFamily,
          color: color ?? Colors.black,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
