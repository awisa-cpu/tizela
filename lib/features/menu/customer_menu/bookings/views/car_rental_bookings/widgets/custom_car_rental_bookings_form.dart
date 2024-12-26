import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/car_rental_bookings_summary_view.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomCarRentalBookingsForm extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomCarRentalBookingsForm({
    super.key,
    required this.carRental,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: CustomColumn(
        children: [
          Text(
            "Pick-up time",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "08:00am"),
            ),
          ),

          //
          Text(
            "Booking duration",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomDropdownForm(
              currentValue: LocalDatabase.durations[0],
              items: LocalDatabase.durations,
              onChanged: (value) {},
            ),
          ),

          //
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.appMainColor,
                size: 18.33,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Cars must be booked for at least 12 hours.",
                  style: customTextStyle(
                      fontSize: 12,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          const CustomHeight(height: 50),
          Text(
            "Enter Itinerary",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Type here..."),
              maxLines: 7,
            ),
          ),

          //
          CustomEleButton(
            onPressed: () {
              AppNagivator.pushRoute(
                CarRentalBookingSummary(
                  carRental: carRental,
                ),
              );
            },
            text: "Proceed",
          ),
        ],
      ),
    );
  }
}
