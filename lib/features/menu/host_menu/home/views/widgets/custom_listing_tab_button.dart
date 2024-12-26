import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomListingTabButton extends StatelessWidget {
  final Color borderColor, bkGroundColor, imageColor;
  final String imageUrl, mainText, subText;
  final VoidCallback onTap;
  const CustomListingTabButton({
    super.key,
    required this.borderColor,
    required this.bkGroundColor,
    required this.imageUrl,
    required this.mainText,
    required this.subText,
    required this.onTap,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      borderColor: borderColor,
      color: bkGroundColor,
      borderRadius: 10.0,
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            color: imageColor,
          ),
          const CustomWidth(width: 10),
          Expanded(
            child: CustomColumn(
              children: [
                Text(
                  mainText,
                  style: customTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomHeight(height: 10),
                Text(
                  subText,
                  style: customTextStyle(
                    fontSize: 13,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.chevron_right_outlined),
          )
        ],
      ),
    );
  }
}
