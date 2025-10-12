import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
typedef OnFieldSubmitted = void Function(String);

class ScTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Validator? validator;
  final OnFieldSubmitted? onFieldSubmitted;
  final TextInputType? keyboardType;
  final EdgeInsets? padding;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  const ScTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType,
    this.padding,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onTapOutside: (_) {
          FocusScope.of(context).unfocus();
        },

        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
