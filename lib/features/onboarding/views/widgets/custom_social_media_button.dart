import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSocialMediaButton extends StatelessWidget {
  final String imageIcon;
  final String linkText;
  final VoidCallback onTap;
  const CustomSocialMediaButton({
    super.key,
    required this.imageIcon,
    required this.onTap,
    required this.linkText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: CustomRoundedEdgedContainer(
          borderRadius: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageIcon),
              const CustomWidth(width: 25),
              Text(
                linkText,
                style: customTextStyle(
                  color: AppColors.appTextFadedColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
