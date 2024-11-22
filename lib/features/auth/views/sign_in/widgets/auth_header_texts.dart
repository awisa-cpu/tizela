import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class AuthHeaderTexts extends StatelessWidget {
  final String mainText;
  final String subText1;
  final String subText2;
  final VoidCallback? onPressedBackButton;
  final bool showBackButton;
  const AuthHeaderTexts({
    super.key,
    required this.mainText,
    required this.subText1,
    required this.subText2,
    this.showBackButton = true,
    this.onPressedBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomHeight(
          height: 25,
        ),
        showBackButton
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressedBackButton,
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.appBlackColor,
                ),
              )
            : const SizedBox.shrink(),
        const CustomHeight(height: 20),
        Text(
          mainText,
          style: customTextStyle(
            fontSize: 20,
          ),
        ),
        const CustomHeight(height: 10),
        Text(
          subText1,
          style: customTextStyle(
              fontSize: 15,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w400),
        ),
        Text(
          subText2,
          style: customTextStyle(
              fontSize: 15,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
