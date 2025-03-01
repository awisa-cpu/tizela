import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomInputDecoTheme {
  static InputDecorationTheme inputDecoTheme() {
    return InputDecorationTheme(
        errorMaxLines: 3,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        labelStyle:
            const TextStyle().copyWith(fontSize: 14, color: Colors.grey),
        hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.grey),
        errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
        floatingLabelStyle:
            const TextStyle().copyWith(color: Colors.black.withValues(alpha: 0.8)),
        border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(width: 1, color: Colors.grey.withValues(alpha: 0.4)),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(width: 1, color: Colors.grey.withValues(alpha: 0.4)),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: AppColors.appMainColor),
        ),
        errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 2, color: Colors.orange),
        ));
  }
}
