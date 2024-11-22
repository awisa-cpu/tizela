import 'package:flutter/material.dart';

TextSpan customTextSpan({
  required String text,
  Color? color = Colors.black,
  double? fontsize = 18,
  FontWeight? fontweight = FontWeight.bold,
}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontweight,
    ),
  );
}
