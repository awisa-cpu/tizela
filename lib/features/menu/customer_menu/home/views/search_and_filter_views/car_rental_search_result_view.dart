import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_result_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_car_rental_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tabs.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import 'custom_car_rental_filter.dart';

class CarRentalSearchResult extends StatelessWidget {
  const CarRentalSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchResultView(
      imageIcon: ImagesText.carIcon,
      title: "Car Rental",
      mainText: "Lagos mainland-No 5, Kosoko Road lema place",
      subText: "Apr 29th",
      listPackages: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Showing 78 results",
            style: customTextStyle(
              fontSize: 14,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomHeight(height: 14),
          CustomTabs(
            locations: LocalDatabase.carTypeNames,
            overflow: TextOverflow.ellipsis,
          ),
          const CustomHeight(height: 14),
          CustomCarRentalPackages(
            carRentals: LocalDatabase.carRentalPackages,
          ),
        ],
      ),
      onTapFilter: () => _diplayCarRentalFilter(context),
    );
  }

  void _diplayCarRentalFilter(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) => const CustomCarRentalFilter(),
    );
  }
}
