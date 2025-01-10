import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';

class CustomBoatCruiseBookingSummarySecondSection extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const CustomBoatCruiseBookingSummarySecondSection({
    super.key,
    required this.boatCruise,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBookingSummaryTab(
      child: CustomColumn(
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomEditIcon(
                onTap: () {},
              )
            ],
          ),
          CustomContainerBookingSummary(
            target: "Date",
            targetValue: AppDateFormater.formatDate(
                date: boatCruise.availableDates[1], useContructor: true),
            shouldExpand: false,
          ),
        ],
      ),
    );
  }
}
