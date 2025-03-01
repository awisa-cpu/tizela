import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tizela/data/services/theme_service/custom_check_box_theme.dart';
import 'package:tizela/data/services/theme_service/custom_text_theme.dart';

import '../../../utils/constants/app_colors.dart';
import 'custom_app_bar_theme.dart';
import 'custom_elevated_button_theme.dart';
import 'custom_icon_button_theme.dart';
import 'custom_input_decoration_button_theme.dart';
import 'custom_outlined_button_theme.dart';
import 'custom_text_button_theme.dart';

class AppThemeController extends GetxController {
  static AppThemeController get instance => Get.find();
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
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
    checkboxTheme: CustomCheckBoxTheme.customCheckBoxTeam(),
    textTheme: CustomTextTheme.customTextTheme,
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  final GetStorage _localStorage = GetStorage();
  final String _userThemeSettingsKey = "appThemeSettings";

  final Rx<ThemeMode> _themeMode = ThemeMode.light.obs;

  //
  Rx<ThemeMode> get themeMode {
    //attempt to fetch the user defined settings for theme
    bool? isUserThemeSettings = _localStorage.read(_userThemeSettingsKey);
    if (isUserThemeSettings != null && isUserThemeSettings) {
      _themeMode.value = ThemeMode.dark;
      return _themeMode;
    }

    return _themeMode;
  }

  //update the theme mode by the user
  void updateThemeMode({required bool isDark}) {
    _themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    _localStorage.write(_userThemeSettingsKey, isDark);
  }
}
