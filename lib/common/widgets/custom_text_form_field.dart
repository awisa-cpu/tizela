import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText, hintText, initialValue;
  final TextEditingController? controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final bool obscureText;
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.controller,
    this.validator,
    this.hintText,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      maxLines: maxLines??1,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon),
      controller: controller,
      validator: validator,
    );
  }
}
