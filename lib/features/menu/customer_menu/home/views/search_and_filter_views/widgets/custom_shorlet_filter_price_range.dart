import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import 'custom_shortlet_filter_min_or_max_price_tab.dart';

class CustomFilterPriceRange extends StatelessWidget {
  final String? subText;
  final double progressIndicatorValue;
  final String minPrice, maxPrice;
  const CustomFilterPriceRange({
    super.key,
    this.subText,
    required this.progressIndicatorValue,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomHeight(height: 15),
        Text(
          "price range",
          style: customTextStyle(
            fontSize: 14,
          ),
        ),
        const CustomHeight(height: 10),
        subText != null
            ? Text(
                subText!,
                style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.normal,
                ),
              )
            : const SizedBox.shrink(),
        const CustomHeight(height: 10),

        //range indicator
        LinearProgressIndicator(
          value: progressIndicatorValue,
          color: AppColors.appMainColor,
          backgroundColor: AppColors.appWhiteColor,
        ),
        const CustomHeight(height: 40),

        //min and max price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomShortletFilterMinOrMaxPriceTab(
              price: "#$minPrice",
            ),
            const CustomWidth(width: 10),
            const Expanded(child: CustomDivider()),
            const CustomWidth(width: 10),
            CustomShortletFilterMinOrMaxPriceTab(
              price: "#$maxPrice+",
            ),
          ],
        ),
        const CustomHeight(height: 10),

        //price specifier
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Minimum"),
            Text("Maximum"),
          ],
        ),
        const CustomHeight(height: 40),
      ],
    );
  }
}
