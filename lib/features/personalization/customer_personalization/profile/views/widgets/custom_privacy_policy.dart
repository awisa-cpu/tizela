import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/model/privacy_policy_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomPrivacyPolicy extends StatelessWidget {
  final PrivacyPolicyModel privacyPolicy;
  const CustomPrivacyPolicy({super.key, required this.privacyPolicy});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "${privacyPolicy.index.toString()}.  ${privacyPolicy.title}",
          style: customTextStyle(fontSize: 16),
        ),
        const CustomHeight(height: 13),
        Text(
          privacyPolicy.body,
          textAlign: TextAlign.justify,
          style: customTextStyle(
              fontSize: 14,
              color: AppColors.appTextFadedColor2,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
