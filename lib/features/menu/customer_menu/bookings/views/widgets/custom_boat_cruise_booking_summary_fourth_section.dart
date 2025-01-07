import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

class CustomBoatCruiseBookingSummaryFourthSection extends StatelessWidget {
  const CustomBoatCruiseBookingSummaryFourthSection({
    super.key,
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
                "Duration",
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
          const CustomContainerBookingSummary(
            target: "Start time",
            targetValue: "7:00AM",
            shouldExpand: false,
          ),
          const CustomHeight(height: 10),
          const CustomContainerBookingSummary(
            target: "End time",
            targetValue: "8:00AM",
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
