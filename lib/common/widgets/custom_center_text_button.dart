import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomCenterTextButton extends StatelessWidget {
  final String actionText;
  final VoidCallback onTap;
  final TextStyle? style;
  const CustomCenterTextButton({
    super.key, required this.actionText, required this.onTap, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          actionText,
          style:  style??  customTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.appTextFadedColor,
          ),
        ),
      ),
    );
  }
}
