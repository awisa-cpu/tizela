import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShortletVariedAttribute extends StatelessWidget {
  final int attributeCount;
  final String attributeName, imageIcon;

  const CustomShortletVariedAttribute({
    super.key,
    required this.attributeCount,
    required this.attributeName,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageIcon),
        const CustomWidth(width: 3),
        Text(
          "$attributeCount $attributeName",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomWidth(width: 3),
        Text(
          ".",
          style: customTextStyle(),
        ),
      ],
    );
  }
}
