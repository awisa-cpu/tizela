import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomInfoNotificationWithText extends StatelessWidget {
  final String text;
  const CustomInfoNotificationWithText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: AppColors.appMainColor,
          size: 15,
        ),
        const CustomWidth(width: 10),
        Text(
          text,
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
