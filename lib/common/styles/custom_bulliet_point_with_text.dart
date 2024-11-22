import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomBullietPointWithText extends StatelessWidget {
  final String text;
  const CustomBullietPointWithText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ".",
            style: customTextStyle(),
          ),
          const CustomWidth(),
          Expanded(
            child: Text(
              textAlign: TextAlign.justify,
              text,
              style: customTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.appTextFadedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
