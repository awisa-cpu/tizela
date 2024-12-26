import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_result_view.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'custom_shortlet_filter.dart';

class ShortLetSearchResultView extends StatelessWidget {
  const ShortLetSearchResultView({super.key});

  void _diplayShortLetFilter(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) => const CustomShortletFilter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchResultView(
      imageIcon: ImagesText.buildingIcon,
      title: "Shortlet",
      mainText: "Lagos Mainlanddd",
      subText: "Mar, 23 - Apr 4. 2 Guestty",
      listPackages: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Showing 78 properties",
            style: customTextStyle(
              fontSize: 14,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const CustomHeight(height: 10),
          // CustomShortletPackages(
          //   shortlets: LocalDatabase.shortletPackages,
          // ),
        ],
      ),
      onTapFilter: () => _diplayShortLetFilter(context),
    );
  }
}
