
import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../host_menu/listings/model/shortlet_model.dart';
import '../../../controller/shortlet_booking_summary_controller.dart';

class CustomShorletBookingSummaryFourthSection extends StatelessWidget {
  final ShortletModel shortletModel;
  const CustomShorletBookingSummaryFourthSection({
    super.key,
    required this.shortletModel,
  });

  @override
  Widget build(BuildContext context) {
      final controller = ShortletBookingSummaryController.instance;

      //
    return CustomBookingSummaryTab(
      child: CustomColumn(
        spacing: 20,
        children: [
          CustomContainerBookingSummary(
            target: "Amount(${controller.getNumberOfDays(shortletModel: shortletModel)})",
            targetValue: "#${controller.calculateCostByDays(shortletModel: shortletModel)}",
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
                "#${controller.calculateFinalCost(shortletModel: shortletModel)}",
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
