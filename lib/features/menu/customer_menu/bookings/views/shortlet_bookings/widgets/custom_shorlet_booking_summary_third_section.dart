import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

class CustomShorletBookingSummaryThirdSection extends StatelessWidget {
  final String guestNunber;
  const CustomShorletBookingSummaryThirdSection({
    super.key, required this.guestNunber,
  });

  @override
  Widget build(BuildContext context) {
    return  CustomBookingSummaryTab(
      child: CustomColumn(
        children: [
          CustomContainerBookingSummary(
            target: "No of Guest",
            targetValue: guestNunber,
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
