import 'package:flutter/material.dart';
import 'package:skill_core/config/constants.dart';

class ScText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final EdgeInsets? padding;
  final String fontFamily;
  final int? maxLines;
  final TextOverflow? overFlow;

  const ScText(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.color,
    this.padding,
    this.fontFamily = robotoFont,
    this.maxLines,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overFlow,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? Theme.of(context).colorScheme.onSurface,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
