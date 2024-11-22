import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_boat_cruise_buttons.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_listing_creation_cost_and_date.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../../model/boat_cruise_model.dart';

class CustomHostBoatCruiseDetails extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const CustomHostBoatCruiseDetails({super.key, required this.boatCruise});

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
                boatCruise.name,
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomReviews(reviewCount: boatCruise.ratingsCount),
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
                  boatCruise.address.addressText,
                  style: customTextStyle(
                    fontSize: 12,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),

          //cost

          CustomHostListingCreationCostAndDate(
            cost: boatCruise.boatFee.toString(),
            perWhat: "per hr",
            dateTime: "May 15th-April 20th",
          ),

          CustomHostBoatCruiseButtons(
            boatCruise: boatCruise,
          ),
        ],
      ),
    );
  }
}
