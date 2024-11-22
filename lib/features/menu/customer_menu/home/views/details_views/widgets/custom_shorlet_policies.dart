import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shorlet_policy_tab.dart';

class CustomShorletPolicies extends StatelessWidget {
  const CustomShorletPolicies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Policies",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        const CustomHeight(height: 12),
        const CustomShortPolicyTab(
          policyMainText: "Check out:",
          subText: "Check out before 10:00 AM",
        ),
        const CustomHeight(height: 12),
        const CustomShortPolicyTab(
          policyMainText: "Pets:",
          subText: "No pets allowed",
        ),
        const CustomHeight(height: 12),
        const CustomShortPolicyTab(
          policyMainText: "Children and extra beds:",
          subText: "Children are welcomed",
        ),
      ],
    );
  }
}
