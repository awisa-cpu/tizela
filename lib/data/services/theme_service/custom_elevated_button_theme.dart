import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData lightElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        enableFeedback: false,
        backgroundColor: AppColors.appMainColor,
        disabledBackgroundColor: AppColors.disabledEleButton,
        disabledForegroundColor: AppColors.disabledEleButton,
        foregroundColor: Colors.white,
        side: const BorderSide(color: AppColors.appMainColor),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textStyle: const TextStyle(color: AppColors.appWhiteColor),
      ),
    );
  }
}
