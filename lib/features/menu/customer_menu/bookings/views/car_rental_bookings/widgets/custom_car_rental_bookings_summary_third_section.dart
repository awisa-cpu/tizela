import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

class CustomCarRentalBookingsSummaryThirdSection extends StatelessWidget {
  final String selectedPickUpTime;
  const CustomCarRentalBookingsSummaryThirdSection({
    super.key,
    required this.selectedPickUpTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
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
          CustomContainerBookingSummary(
            target: "Pick-up",
            targetValue: selectedPickUpTime,
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
