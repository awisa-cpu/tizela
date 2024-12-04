import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../../controllers/edit_host_boat_cruise_controller.dart';
import '../../model/boat_cruise_model.dart';
import '../edit_listing/boat_cruise/edit_host_boatcruise_details.dart';
import '../edit_listing/boat_cruise/edit_host_boatcruise_priceset.dart';

class CustomHostBoatCruiseButtons extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const CustomHostBoatCruiseButtons({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    Get.put(EditHostBoatCruiseController());

    //
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "Edit Availability",
              style: customTextStyle(
                  color: AppColors.appMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.appMainColor),
            ),
          ),

          //price
          GestureDetector(
            onTap: () {
              Get.to(
                () => EditHostBoatcruisePriceset(
                  boatCruise: boatCruise,
                ),
              );
            },
            child: Text(
              "Edit Price",
              style: customTextStyle(
                  color: AppColors.appMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.appMainColor),
            ),
          ),

          //details
          GestureDetector(
            onTap: () {
              Get.to(
                () => EditHostBoatcruiseDetails(
                  boatCruise: boatCruise,
                ),
              );
            },
            child: Text(
              "View Details",
              style: customTextStyle(
                  color: AppColors.appMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.appMainColor),
            ),
          ),
        ],
      ),
    );
  }
}
