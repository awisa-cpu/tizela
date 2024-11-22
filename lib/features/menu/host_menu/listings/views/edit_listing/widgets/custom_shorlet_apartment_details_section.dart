import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShorletApartmentDetailsSection extends StatelessWidget {
  final String detailTitle, value;
  final bool showDivider;
  const CustomShorletApartmentDetailsSection({
    super.key,
    required this.detailTitle,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailTitle,
                style: customTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appTextFadedColor,
                ),
              ),
              Text(
                value,
                style: customTextStyle(),
              )
            ],
          ),
          if (showDivider)
            const CustomColumn(
              children: [
                CustomHeight(),
                CustomDivider(
                  opacityLevel: 0.15,
                ),
              ],
            )
        ],
      ),
    );
  }
}
