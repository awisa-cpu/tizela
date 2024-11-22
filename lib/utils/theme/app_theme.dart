import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_app_bar_theme.dart';
import 'custom_elevated_button_theme.dart';
import 'custom_icon_button_theme.dart';
import 'custom_input_decoration_button_theme.dart';
import 'custom_outlined_button_theme.dart';
import 'custom_text_button_theme.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.appWhiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appMainColor),
    useMaterial3: true,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme(),
    fontFamily: 'BR Firma',
    textButtonTheme: CustomTextButtonTheme.textButtonTheme(),
    inputDecorationTheme: CustomInputDecoTheme.inputDecoTheme(),
    iconButtonTheme: CustomIconButtonTheme.iconButtonTheme(),
    appBarTheme: CustomAppBarTheme.appBarTheme(),
    outlinedButtonTheme: CustomOutlinedButttonTheme.customOutlinedButtonTheme(),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(AppColors.appWhiteColor),
      overlayColor: WidgetStatePropertyAll(AppColors.appWhiteColor),
      side: BorderSide(color: AppColors.appTextFadedColor),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
