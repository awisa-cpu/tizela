import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../controllers/edit_host_car_rental_controller.dart';
import '../edit_listing/car_rental/edit_host_carrental_details.dart';
import '../edit_listing/car_rental/edit_host_carrental_priceset.dart';

class CustomHostCarRentalButtons extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomHostCarRentalButtons({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    Get.put(EditHostCarRentalController());

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

          //
          GestureDetector(
            onTap: () => Get.to(
              () => EditHostCarrentalPriceset(
                carRental: carRental,
              ),
            ),
            child: Text(
              "Edit Price",
              style: customTextStyle(
                  color: AppColors.appMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.appMainColor),
            ),
          ),

          //
          GestureDetector(
            onTap: () {
              Get.to(
                () => EditHostCarrentalDetails(
                  carRental: carRental,
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
