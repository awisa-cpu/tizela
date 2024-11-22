import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShorletBookingSummaryFourthSection extends StatelessWidget {
  const CustomShorletBookingSummaryFourthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        children: [
          const CustomContainerBookingSummary(
            target: "Amount(5 days)",
            location: "#500,000",
            shouldExpand: false,
          ),
          const CustomHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Caution fee (Refundable)",
                    style: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.appMainColor,
                    size: 18,
                  )
                ],
              ),
              Text("#50,000",
                  style: customTextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
          const CustomHeight(height: 20),
          const CustomDivider(),
          const CustomHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: customTextStyle(
                  fontSize: 14,
                  color: AppColors.appTextFadedColor,
                ),
              ),
              const CustomWidth(width: 5),
              Text(
                "#550,000",
                style: customTextStyle(
                  fontSize: 14,
                  color: AppColors.appMainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
