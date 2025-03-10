import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

class CustomBoatCruiseBookingSummaryFourthSection extends StatelessWidget {
  final String startTime, endTime;
  const CustomBoatCruiseBookingSummaryFourthSection({
    super.key,
    required this.startTime,
    required this.endTime,
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
          CustomContainerBookingSummary(
            target: "Start time",
            targetValue: startTime,
            shouldExpand: false,
          ),
          const CustomHeight(height: 10),
          CustomContainerBookingSummary(
            target: "End time",
            targetValue: endTime,
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
