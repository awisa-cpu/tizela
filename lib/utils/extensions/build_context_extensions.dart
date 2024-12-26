import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double screenHeight() => MediaQuery.sizeOf(this).height;
  double screenWidth() => MediaQuery.sizeOf(this).width;
  Size screenSize() => MediaQuery.sizeOf(this);
}

extension AppTheme on BuildContext {
  bool isAppThemeDark() =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}

extension AppBarHeight on BuildContext {
  double appBarHeight() => kToolbarHeight;
}
