import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSeeMoreHeader extends StatelessWidget {
  const CustomSeeMoreHeader({
    super.key,
    required this.headingText,
    required this.subText,
  });

  final String headingText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => AppNagivator.goBack(),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        const CustomHeight(height: 20),
        Text(
          headingText,
          style: customTextStyle(fontSize: 20),
        ),
        const CustomHeight(height: 10),
        Text(
          subText,
          style: customTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.appTextFadedColor,
          ),
        ),
      ],
    );
  }
}
