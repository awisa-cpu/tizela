import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../host_menu/listings/model/shortlet_model.dart';

class CustomShorletBookingSummarySecondSection extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomShorletBookingSummarySecondSection({
    super.key,
    required this.shortlet,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        spacing: 20,
        children: [
          CustomContainerBookingSummary(
            target: "Date",
            targetValue: AppFunctions.getDateRange(
                availableDates: shortlet.availableDates),
            shouldExpand: false,
          ),
          CustomContainerBookingSummary(
            target: "Check in time",
            targetValue: shortlet.checkInTime,
            shouldExpand: false,
          ),
          CustomContainerBookingSummary(
            target: "Check out time",
            targetValue: shortlet.checkOutTime,
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
