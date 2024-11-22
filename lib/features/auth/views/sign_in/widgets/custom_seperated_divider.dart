import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSeperatedDivider extends StatelessWidget {
  const CustomSeperatedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            endIndent: 10,
          ),
        ),
        Text(
          'or',
          style: customTextStyle(
            color: AppColors.appTextFadedColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.4,
            indent: 10,
          ),
        ),
      ],
    );
  }
}
