import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomTab extends StatelessWidget {
  final String text, imageIcon;
  final Color? iconColor;
  const CustomTab({
    super.key,
    required this.text,
    required this.imageIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageIcon,
          color: iconColor,
        ),
        const CustomWidth(width: 5),
        Text(
          text,
          style: customTextStyle(
            fontSize: 12.89,
            color: AppColors.appTextFadedColor2,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
