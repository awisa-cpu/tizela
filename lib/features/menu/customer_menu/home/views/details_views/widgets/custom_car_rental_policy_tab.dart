import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import 'custom_details_text_tab.dart';

class CustomCarRentalPolicyTab extends StatelessWidget {
  final String heading, policy1, policy2;
  const CustomCarRentalPolicyTab({
    super.key,
    required this.heading,
    required this.policy1,
    required this.policy2,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      margin: const EdgeInsets.symmetric(vertical: 10),
      borderRadius: 5,
      showBorder: false,
      width: context.screenWidth(),
      color: AppColors.appColorBox,
      child: CustomColumn(
        children: [
          Text(
            heading,
            style: customTextStyle(
                fontSize: 12, color: AppColors.appTextFadedColor),
          ),
          const CustomHeight(height: 15),
          CustomDetailsTextTab(
            mainText: policy1,
          ),
          const CustomHeight(height: 15),
          CustomDetailsTextTab(
            mainText: policy2,
          ),
        ],
      ),
    );
  }
}
