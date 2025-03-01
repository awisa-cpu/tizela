import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomAppBarTheme{


   static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.appWhiteColor,
      centerTitle: true,
    );
  }

}