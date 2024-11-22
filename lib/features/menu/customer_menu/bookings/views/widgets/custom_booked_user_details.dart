import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomBookedUserDetails extends StatelessWidget {
  const CustomBookedUserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        children: [
          const CustomContainerBookingSummary(
            target: "Name",
            location: "Asuquo Godwin",
            shouldExpand: false,
          ),
          const CustomHeight(height: 13.5),
          const CustomContainerBookingSummary(
            target: "Email",
            location: "godwinasuguo@gmail.com",
            shouldExpand: false,
          ),
          const CustomHeight(height: 13.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction ID",
                style: customTextStyle(
                  fontSize: 14,
                  color: AppColors.appTextFadedColor,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "5478299372",
                    style: customTextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  Image.asset(ImagesText.transactionIdFrame),
                ],
              )
            ],
          ),
          const CustomHeight(height: 13.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: customTextStyle(
                  fontSize: 14,
                  color: AppColors.appTextFadedColor,
                ),
              ),
              const CustomBookingStatus(
                statusText: "Paid",
                textAndBorderColor: AppColors.appMainColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
