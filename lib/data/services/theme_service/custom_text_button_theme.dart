

import 'package:flutter/material.dart';

class CustomTextButtonTheme{
  
  static TextButtonThemeData textButtonTheme() {
    return const TextButtonThemeData(
        style: ButtonStyle(
      enableFeedback: false,
    ));
  }

}