import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_span.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomDetailsTextTab extends StatelessWidget {
  final String mainText;
  const CustomDetailsTextTab({
    super.key,
    required this.mainText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          customTextSpan(
            text: ". ",
          ),
          customTextSpan(
            color: AppColors.appTextFadedColor,
            fontsize: 13,
            fontweight: FontWeight.normal,
            text: mainText,
          ),
        ],
      ),
    );
  }
}
