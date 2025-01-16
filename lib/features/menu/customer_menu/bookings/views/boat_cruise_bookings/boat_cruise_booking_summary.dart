import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/widgets/custom_boat_cruse_booking_first_section.dart';

import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import '../../controller/boat_cruise_booking_summary_controller.dart';
import 'widgets/custom_boat_cruise_booking_summary_fourth_section.dart';
import 'widgets/custom_boat_cruise_booking_summary_third_section.dart';
import 'widgets/custom_boat_cruise_booking_summary_second_section.dart';

class BoatCruiseBookingSummary extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const BoatCruiseBookingSummary({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = BoatCruiseBookingSummaryController.instance;

    //
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Booking summary",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          spacing: 30,
          children: [
            CustomBoatCruseBookingFirstSection(
              boatCruise: boatCruise,
            ),
            CustomBoatCruiseBookingSummarySecondSection(
              boatCruise: boatCruise,
            ),
            CustomBoatCruiseBookingSummaryThirdSection(
              passengerCount: controller.selectedPassengerNumber.value,
            ),
            CustomBoatCruiseBookingSummaryFourthSection(
              startTime: controller.selectedStartTimeOfDay.value,
              endTime: controller.selectedEndTimeOfDay.value,
            ),
            CustomEleButton(
              onPressed: () => controller.processToCheckOut(),
              text: "Checkout",
            )
          ],
        ),
      ),
    );
  }
}
