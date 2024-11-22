import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSecondShortletDetailsSection extends StatelessWidget {
  const CustomSecondShortletDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomHeight(height: 10),
        Text(
          "Amenities available",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        const CustomHeight(height: 10),
        Text(
          "Smart 65-inch TV and sound systems",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 10),
        Text(
          "Wifi",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 10),
        Text(
          "Kitchen",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 10),
        Text(
          "Parking",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 10),
        Text(
          "Garden view",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 10),
        CustomOutlinedButton(
          actionText: "Show all 24 amenities",
          onTap: () {},
        ),
        const CustomHeight(height: 10),
      ],
    );
  }
}
