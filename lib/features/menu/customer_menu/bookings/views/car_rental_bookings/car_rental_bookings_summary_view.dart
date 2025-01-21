import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/widgets/custom_car_rental_bookings_first_section.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import '../../controller/car_rental_bookings_controller.dart';
import 'widgets/custom_car_rental_bookings_sumary_fourth_section.dart';
import 'widgets/custom_car_rental_bookings_summary_fifth_section.dart';
import 'widgets/custom_car_rental_bookings_summary_second_section.dart';
import 'widgets/custom_car_rental_bookings_summary_third_section.dart';

class CarRentalBookingSummary extends StatelessWidget {
  final CarRentalModel carRental;
  const CarRentalBookingSummary({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = CarRentalBookingsController.instance;

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
            CustomCarRentalBookingsFirstSection(
              carRental: carRental,
            ),
            CustomCarRentalBookingsSummarySecondSection(
              carRental: carRental,
            ),
            CustomCarRentalBookingsSummaryThirdSection(
              selectedPickUpTime: controller.selectedTimeOfDay.value,
            ),
            CustomCarRentalBookingsSumaryFourthSection(
              selectedDuration: controller.selectedBookingDuration.value,
            ),
            CustomCarRentalBookingsSummaryFifthSection(
              iteneryText: controller.itenaryCon.text,
            ),
            CustomEleButton(
              onPressed: () =>
                  controller.checkoutForCarRentalBooking(carRental: carRental),
              text: "Checkout",
            )
          ],
        ),
      ),
    );
  }
}
