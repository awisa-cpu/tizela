import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/custom_boat_cruise_filter.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_result_view.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class BoatCruiseSearchResult extends StatelessWidget {
  const BoatCruiseSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchResultView(
      imageIcon: ImagesText.shipIcon,
      title: "Boat cruise",
      mainText: "Yacht",
      listPackages: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Showing 20 boats for search",
            style: customTextStyle(
              fontSize: 14,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomHeight(height: 10),
          // CustomBoatCruisePackages(
          //   boatCruise: LocalDatabase.boatCruisePackages,
          // ),
        ],
      ),
      onTapFilter: () => _diplayBoatCruiseFilter(context),
    );
  }

  void _diplayBoatCruiseFilter(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) => const CustomBoatCruiseFilter(),
    );
  }
}
