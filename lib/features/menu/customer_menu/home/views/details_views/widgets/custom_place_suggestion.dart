import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomPlaceSuggestion extends StatelessWidget {
  final String placeText, driveText;
  const CustomPlaceSuggestion({
    super.key,
    required this.placeText,
    required this.driveText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImagesText.locationIcon),
              const CustomWidth(width: 5),
              Text(
                placeText,
                style: customTextStyle(
                  fontSize: 13,
                  color: AppColors.appTextFadedColor2,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            driveText,
            style: customTextStyle(
              fontSize: 13,
              color: AppColors.appMainColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
