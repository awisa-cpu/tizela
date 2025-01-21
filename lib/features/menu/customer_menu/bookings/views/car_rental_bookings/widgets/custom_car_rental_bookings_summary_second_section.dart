import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_edit_icon.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';

import '../../../../../host_menu/listings/model/car_rental_model.dart';

class CustomCarRentalBookingsSummarySecondSection extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomCarRentalBookingsSummarySecondSection({
    super.key,
    required this.carRental,
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
                "Locations",
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
          //todo : fix the address for the car-rental_controller when creating a new one by the host
          CustomContainerBookingSummary(
            target: "Pick-up",
            targetValue: carRental.address.addressWithoutPostal,
          ),
          // const CustomHeight(height: 20),
          // const CustomContainerBookingSummary(
          //   target: "Drop-off",
          //   targetValue: "No.4 atiku road, Lagos plaza kilometer road",
          // ),
          const CustomHeight(height: 20),
        ],
      ),
    );
  }
}
