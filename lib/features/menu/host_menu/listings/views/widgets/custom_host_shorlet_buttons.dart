import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/edit_host_availability_setup_view.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../edit_listing/shorlet/edit_host_shorlet_details.dart';
import '../edit_listing/shorlet/edit_host_shorlet_pricesset.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

class CustomHostShorletButtons extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomHostShorletButtons({
    super.key,
    required this.shortlet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.to(
              () => EditHostAvailabilitySetupView(shorlet: shortlet),
            ),
            child: Text(
              "Edit Availability",
              style: customTextStyle(
                color: AppColors.appMainColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.appMainColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () => EditHostShorletPricesset(shortlet: shortlet),
            ),
            child: Text(
              "Edit Price",
              style: customTextStyle(
                  color: AppColors.appMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.appMainColor),
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () => EditHostShorletDetails(shortlet: shortlet),
            ),
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
