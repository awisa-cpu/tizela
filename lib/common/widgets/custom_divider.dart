import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomDivider extends StatelessWidget {
  final double opacityLevel;
  final double? thickness;
  const CustomDivider({super.key, this.opacityLevel = 0.3, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: AppColors.appTextFadedColor.withValues(alpha: opacityLevel),
    );
  }
}
