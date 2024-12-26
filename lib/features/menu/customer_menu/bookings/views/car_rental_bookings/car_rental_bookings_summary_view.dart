import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/success_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/widgets/custom_car_rental_bookings_first_section.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/setup/app_navigator.dart';
import '../widgets/custom_car_rental_bookings_sumary_fourth_section.dart';
import '../widgets/custom_car_rental_bookings_summary_fifth_section.dart';
import '../widgets/custom_car_rental_bookings_summary_second_section.dart';
import '../widgets/custom_car_rental_bookings_summary_third_section.dart';

class CarRentalBookingSummary extends StatelessWidget {
  final CarRentalModel carRental;
  const CarRentalBookingSummary({super.key, required this.carRental});

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
            CustomCarRentalBookingsFirstSection(
              carRental: carRental,
            ),
            const CustomHeight(height: 30),
            const CustomCarRentalBookingsSummarySecondSection(),
            const CustomHeight(height: 30),
            const CustomCarRentalBookingsSummaryThirdSection(),
            const CustomHeight(height: 30),
            const CustomCarRentalBookingsSumaryFourthSection(),
            const CustomHeight(height: 30),
            const CustomCarRentalBookingsSummaryFifthSection(),
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
