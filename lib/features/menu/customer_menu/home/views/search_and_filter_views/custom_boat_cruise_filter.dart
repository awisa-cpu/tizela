import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_sortby.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_shorlet_filter_price_range.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import 'widgets/custom_boat_cruise_filter_boat_types.dart';
import 'widgets/custom_filter_header.dart';

class CustomBoatCruiseFilter extends StatelessWidget {
  const CustomBoatCruiseFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          const CustomFilterHeader(),
          const CustomHeight(height: 15),
          const CustomDivider(),
          const CustomHeight(height: 15),
          Text(
            "Sort by",
            style: customTextStyle(
              fontSize: 14,
            ),
          ),
          const CustomHeight(height: 15),
          CustomFilterSortBy(text: "By ratings", isChecked: false,onValueChanged: (value) {
            
          },),
          CustomFilterSortBy(text: "By reviews",isChecked: false,onValueChanged: (value) {
            
          },),
          CustomFilterSortBy(text: "From expensive to cheap",isChecked: false,onValueChanged: (value) {
            
          },),
          CustomFilterSortBy(text: "From cheap to expensive",isChecked: false,onValueChanged: (value) {
            
          },),
          const CustomHeight(height: 15),
          const CustomFilterPriceRange(
            subText: "You will be charged per hour for boat",
            minPrice: "150,000",
            maxPrice: "700,000",
            progressIndicatorValue: 0.55,
          ),
          const CustomDivider(),
          const CustomHeight(height: 40),
          Text(
            "Passengers",
            style: customTextStyle(
              fontSize: 14,
            ),
          ),
          const CustomHeight(height: 15),
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: const [
                CustomFilterTab(
                  text: '1-3',
                  color: AppColors.appMainColor,
                  marginValue: 0.0,
                  textColor: AppColors.appWhiteColor,
                  width: 100,
                  borderRadius: 30,
                ),
                SizedBox(width: 10),
                CustomFilterTab(
                  text: '4-5',
                  color: AppColors.appWhiteColor,
                  marginValue: 0.0,
                  textColor: AppColors.appTextFadedColor,
                  width: 100,
                  borderRadius: 30,
                ),
                SizedBox(width: 10),
                CustomFilterTab(
                  text: '6+',
                  color: AppColors.appWhiteColor,
                  marginValue: 0.0,
                  textColor: AppColors.appTextFadedColor,
                  width: 100,
                  borderRadius: 30,
                ),
              ],
            ),
          ),
          const CustomHeight(height: 15),
          const CustomDivider(),
          const CustomHeight(height: 40),
          const CustomBoatCruiseFilterBoatTypes()
        ],
      ),
    );
  }
}
