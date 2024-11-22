

import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

TextStyle customTextStyle({
  Color color = AppColors.appBlackColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.bold,
  TextOverflow? overflow,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: overflow,
    decoration: decoration,
    decorationColor: decorationColor
  );
}
