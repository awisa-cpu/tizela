import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomHomeSearchBar extends StatelessWidget {
  final String mainText;
  final String hintText;
  final VoidCallback onTap;
  const CustomHomeSearchBar({
    super.key,
    required this.mainText,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400)),
        child: Row(
          children: [
            Image.asset(ImagesText.searchIcon),
            const CustomWidth(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainText,
                  style: customTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  hintText,
                  style: customTextStyle(
                    fontSize: 11,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
