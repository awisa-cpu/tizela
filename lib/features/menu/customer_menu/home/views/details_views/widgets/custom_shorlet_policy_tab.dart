import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShortPolicyTab extends StatelessWidget {
  final String policyMainText, subText;
  const CustomShortPolicyTab({
    super.key,
    required this.policyMainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
        borderRadius: 10.0,
        width: double.infinity,
        color: AppColors.appColorBox,
        showBorder: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              policyMainText,
              style: customTextStyle(
                fontSize: 12,
              ),
            ),
            const CustomHeight(height: 6),
            Text(
              subText,
              style: customTextStyle(
                fontSize: 12,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ));
  }
}
