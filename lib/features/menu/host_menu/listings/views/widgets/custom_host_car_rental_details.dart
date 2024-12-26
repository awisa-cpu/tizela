import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_car_rental_buttons.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_listing_creation_cost_and_date.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';

class CustomHostCarRentalDetails extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomHostCarRentalDetails({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.5),
      child: CustomColumn(
        children: [
          //name and rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                carRental.carBrand.name,
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomReviews(reviewCount: carRental.ratingsCount),
            ],
          ),

          //other details

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                Text(
                  carRental.address.addressWithoutPostal,
                  style: customTextStyle(
                      fontSize: 12,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),

          //cost
          CustomHostListingCreationCostAndDate(
              cost: carRental.carPrice.toString(),
              perWhat: "per hr",
              dateTime: AppFunctions.getDateRange(
                availableDates: carRental.availableDates,
              )),

          CustomHostCarRentalButtons(
            carRental: carRental,
          ),
        ],
      ),
    );
  }
}
