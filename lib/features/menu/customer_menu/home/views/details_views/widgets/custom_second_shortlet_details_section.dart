import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../host_menu/listings/model/shortlet_model.dart';

class CustomSecondShortletDetailsSection extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomSecondShortletDetailsSection({
    super.key,
    required this.shortlet,
  });

  @override
  Widget build(BuildContext context) {
    final totalAmenities = [
      ...shortlet.amenities.where((feature) => feature.isActive.value == true),
      ...shortlet.safetyFeatures
          .where((feature) => feature.isActive.value == true),
      ...shortlet.standOutAmenities
          .where((feature) => feature.isActive.value == true),
    ];

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomHeight(height: 10),
        Text(
          "Amenities available",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        const CustomHeight(height: 10),
        ...totalAmenities.take(3).map(
          (feature) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 7.5),
              child: Text(
                feature.name,
                style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          },
        ),
        CustomOutlinedButton(
          actionText: "Show all ${totalAmenities.length} amenities",
          onTap: () {},
        ),
        const CustomHeight(height: 10),
      ],
    );
  }
}
