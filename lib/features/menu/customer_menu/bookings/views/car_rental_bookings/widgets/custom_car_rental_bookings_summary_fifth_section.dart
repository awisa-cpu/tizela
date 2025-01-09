import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomCarRentalBookingsSummaryFifthSection extends StatelessWidget {
  final String iteneryText;
  const CustomCarRentalBookingsSummaryFifthSection({
    super.key, required this.iteneryText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      height: 200,
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Itinery",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomEditIcon(
                onTap: () {},
              )
            ],
          ),
          const CustomHeight(height: 20),
          Expanded(
            child: Text(
              iteneryText,
              style: customTextStyle(
                fontSize: 14,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
