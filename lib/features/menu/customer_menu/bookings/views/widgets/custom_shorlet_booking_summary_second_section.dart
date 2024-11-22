import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

class CustomShorletBookingSummarySecondSection extends StatelessWidget {
  const CustomShorletBookingSummarySecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomBookingSummaryTab(
      child: CustomColumn(
        children: [
          CustomContainerBookingSummary(
            target: "Date",
            location: "April 24 - May 4, 2024",
            shouldExpand: false,
          ),
          SizedBox(height: 20),
          CustomContainerBookingSummary(
            target: "Check in time",
            location: "10:00am",
            shouldExpand: false,
          ),
          SizedBox(height: 20),
          CustomContainerBookingSummary(
            target: "Check out time",
            location: "09:00am",
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
