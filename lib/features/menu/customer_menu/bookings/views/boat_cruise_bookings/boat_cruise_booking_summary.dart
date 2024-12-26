import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_booking_view.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import '../widgets/custom_boat_cruise_booking_summary_fourth_section.dart';
import '../widgets/custom_boat_cruise_booking_summary_second_section.dart';
import '../widgets/custom_boat_cruise_booking_summary_third_section.dart';

class BoatCruiseBookingSummary extends StatelessWidget {
  final BoatCruiseModel  boatCruise;
  const BoatCruiseBookingSummary({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
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
          children: [
            CustomBoatCruseBookingFirstSection(
              boatCruise: boatCruise,
            ),
            const CustomHeight(height: 30),
            const CustomBoatCruiseBookingSummarySecondSection(),
            const CustomHeight(height: 30),
            const CustomBoatCruiseBookingSummaryThirdSection(),
            const CustomHeight(height: 30),
            const CustomBoatCruiseBookingSummaryFourthSection(),
            const CustomHeight(height: 30),
            CustomEleButton(
              onPressed: () => AppNagivator.pushRoute(
                const SuccessView(
                    mainText: "Booking successful",
                    subText:
                        "Thank you for your bookings, we will get back to you as soon as possible"),
              ),
              text: "Checkout",
            )
          ],
        ),
      ),
    );
  }
}
