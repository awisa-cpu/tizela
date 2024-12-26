import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomOutlinedButttonTheme {
  static OutlinedButtonThemeData customOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      enableFeedback: false,
      backgroundColor: AppColors.appWhiteColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      foregroundColor: AppColors.appBlackColor,
      side:
          BorderSide(color: AppColors.appTextFadedColor.withValues(alpha: 0.4)),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      textStyle: const TextStyle(color: AppColors.appWhiteColor),
    ));
  }
}
