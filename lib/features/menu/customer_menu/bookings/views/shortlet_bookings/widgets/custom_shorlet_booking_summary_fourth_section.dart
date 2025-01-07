
import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../host_menu/listings/model/shortlet_model.dart';

class CustomShorletBookingSummaryFourthSection extends StatelessWidget {
  final ShortletModel shortletModel;
  const CustomShorletBookingSummaryFourthSection({
    super.key,
    required this.shortletModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        spacing: 20,
        children: [
          CustomContainerBookingSummary(
            target: "Amount(${getNumberOfDays()})",
            targetValue: "#${calculateCostByDays()}",
            shouldExpand: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Caution fee (Refundable)",
                    style: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.appMainColor,
                    size: 18,
                  )
                ],
              ),
              Text(
                "#${shortletModel.cautionFee}",
                style: customTextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const CustomDivider(),
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
                "#${calculateFinalCost()}",
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

  String getNumberOfDays({bool shouldreturnOnlyvalue = false}) {
    final day = shortletModel.availableDates[1]
        .difference(shortletModel.availableDates[0]);
    if (shouldreturnOnlyvalue) {
      if (day.inDays <= 0) {
        return "0";
      } else {
        return day.inDays.toString();
      }
    }
    if (day.inDays <= 0) {
      return "0 days";
    }
    return "${day.inDays.toString()} days";
  }

  double calculateCostByDays() {
    final daysValue =
        double.tryParse(getNumberOfDays(shouldreturnOnlyvalue: true)) ?? 1.0;
    final totalCost = daysValue * shortletModel.apartmentPrice;

    return totalCost;
  }

  int calculateFinalCost() {
    final finalCost =
        (calculateCostByDays() + shortletModel.cautionFee).round();
    return finalCost;
  }
}
