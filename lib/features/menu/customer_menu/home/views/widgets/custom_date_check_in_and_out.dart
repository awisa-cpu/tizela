import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomDateCheckInAndOut extends StatelessWidget {
  final String checkIn, checkOut, imageIcon;
  final VoidCallback onTap;
  const CustomDateCheckInAndOut({
    super.key,
    required this.checkIn,
    required this.checkOut,
    required this.imageIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageIcon),
        const CustomWidth(width: 6),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              checkIn,
              style: customTextStyle(
                fontSize: 14,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            const CustomHeight(height: 5),
            Text(
              checkOut,
              style: customTextStyle(
                fontSize: 16,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
