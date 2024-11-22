import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "By continuing, you have read and agreed to Tizela's ",
          style: customTextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.appTextFadedColor,
          ),
        ),
        const CustomHeight(height: 5),
        Wrap(
          children: [
            GestureDetector(
              child: const Text("Terms & Conditions",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.appMainColor)),
            ),
            Text(
              " and acknowledge the ",
              style: customTextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.appTextFadedColor,
              ),
            ),
            GestureDetector(
              child: const Text("Privacy Policy",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.appMainColor)),
            ),
          ],
        ),
      ],
    );
  }
}
