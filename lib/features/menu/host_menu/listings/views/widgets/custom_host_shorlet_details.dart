import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_listing_creation_cost_and_date.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_shorlet_buttons.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../../../../../../utils/device/app_functions.dart/app_functions.dart';

class CustomHostShorletDetails extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomHostShorletDetails({
    super.key,
    required this.shortlet,
  });

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
                shortlet.apartmentName,
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomReviews(reviewCount: shortlet.ratingsCount),
            ],
          ),

          //other details
          Text(
            shortlet.apartmentType.name,
            style: customTextStyle(
                fontSize: 12,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.w300),
          ),
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
                  shortlet.address.addressWithoutPostal,
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
            cost: shortlet.apartmentPrice.toStringAsFixed(2),
            perWhat: "per hr",
            dateTime: AppFunctions.getDateRange(
                availableDates: shortlet.availableDates),
          ),

          CustomHostShorletButtons(
            shortlet: shortlet,
          ),
        ],
      ),
    );
  }
}
