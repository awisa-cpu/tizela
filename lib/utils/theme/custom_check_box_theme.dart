import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomCheckBoxTheme {
  static CheckboxThemeData customCheckBoxTeam() {
    return const CheckboxThemeData(
    checkColor: WidgetStatePropertyAll(AppColors.appWhiteColor),
    overlayColor: WidgetStatePropertyAll(AppColors.appWhiteColor),
    side: BorderSide(color: AppColors.appTextFadedColor),
  );
  }
}