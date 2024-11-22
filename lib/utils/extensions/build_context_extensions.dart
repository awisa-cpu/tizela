import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.height;
  Size screenSize() => MediaQuery.of(this).size;
}

extension AppTheme on BuildContext {
  bool isAppThemeDark() =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}

extension AppBarHeight on BuildContext {
  double appBarHeight() => kToolbarHeight;
}
