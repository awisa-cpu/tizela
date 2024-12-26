import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomAnalyticsTab extends StatelessWidget {
  final String headerText, itemCount;
  final VoidCallback onTap;
  final double? width;
  const CustomAnalyticsTab({
    super.key,
    required this.headerText,
    required this.itemCount,
    required this.onTap,
    this.width = 180,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      borderColor: AppColors.appTextFadedColor.withValues(alpha: 0.4),
      paddingNumber: 18,
      width: width,
      child: CustomColumn(
        children: [
          Text(
            headerText,
            style: customTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.appTextFadedColor),
          ),
          const CustomHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemCount,
                style: customTextStyle(fontSize: 30),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.chevron_right_outlined,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
