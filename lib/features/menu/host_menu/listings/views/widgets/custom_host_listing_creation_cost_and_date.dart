// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomHostListingCreationCostAndDate extends StatelessWidget {
  final String cost, perWhat, dateTime;

  const CustomHostListingCreationCostAndDate({
    super.key,
    required this.dateTime, required this.cost, required this.perWhat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDisplayCost(
          cost: cost,
          perWhat: perWhat,
          isSpaceBtwPerWhat: false,
          costColor: AppColors.appBlackColor,
          perWhatColor: AppColors.appBlackColor,
          costFontWeight: FontWeight.bold,
          perWhatFontWeight: FontWeight.bold,
          perWhatFontSize: 16,
          costFontSize: 16,
        ),
        const CustomWidth(width: 20),
        Expanded(
          child: CustomRoundedEdgedContainer(
            borderColor: AppColors.appMainColor,
            color: AppColors.appIconColorBox,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Avail: $dateTime"),
          ),
        )
      ],
    );
  }
}
