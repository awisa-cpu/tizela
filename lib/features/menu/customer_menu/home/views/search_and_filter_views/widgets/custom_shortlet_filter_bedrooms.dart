import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import 'custom_filter_tab.dart';

class CustomShortletFilterBedrooms extends StatelessWidget {
  const CustomShortletFilterBedrooms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Bedrooms",
          style: customTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.appTextFadedColor,
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
                text: 'Any',
                color: AppColors.appMainColor,
                marginValue: 0.0,
                textColor: AppColors.appWhiteColor,
                width: 100,
                borderRadius: 30,
              ),
              CustomFilterTab(
                text: "1",
              ),
              CustomFilterTab(
                text: "2",
              ),
              CustomFilterTab(
                text: "3",
              ),
              CustomFilterTab(
                text: "4",
              ),
              CustomFilterTab(
                text: "5",
              )
            ],
          ),
        ),
      ],
    );
  }
}
