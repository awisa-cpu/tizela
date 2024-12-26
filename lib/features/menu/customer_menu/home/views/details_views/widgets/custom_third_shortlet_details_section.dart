import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';


class CustomThirdShortletDetailsSection extends StatelessWidget {
  final String? story;
  const CustomThirdShortletDetailsSection({
    super.key, 
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomHeight(height: 12),
        Text(
          "About the place",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        const CustomHeight(height: 12),
        Text(
          story??'',
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.normal),
        ),
        const CustomHeight(height: 12),
      ],
    );
  }
}
