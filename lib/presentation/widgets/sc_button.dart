import 'package:flutter/material.dart';

class ScButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const ScButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(
            Theme.of(context).primaryColor,
          ),
          maximumSize: WidgetStatePropertyAll<Size>(
            Size(MediaQuery.sizeOf(context).width / 2, 60),
          ),
          minimumSize: WidgetStatePropertyAll<Size>(
            Size(MediaQuery.sizeOf(context).width / 3, 40),
          ),
        ),
        child: child,
      ),
    );
  }
}
