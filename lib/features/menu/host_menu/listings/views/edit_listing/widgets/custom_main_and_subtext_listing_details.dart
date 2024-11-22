import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomMainAndSubtextListingDetails extends StatelessWidget {
  final String attribute, value;
  const CustomMainAndSubtextListingDetails({
    super.key,
    required this.attribute,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: CustomColumn(
        children: [
          Text(
            attribute,
            style: customTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          const CustomHeight(),
          Text(
            value,
            style: customTextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.appTextFadedColor,
            ),
          ),
        ],
      ),
    );
  }
}
