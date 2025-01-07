import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shorlet_policy_tab.dart';
import '../../../../../host_menu/listings/model/shortlet_model.dart';

class CustomShorletPolicies extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomShorletPolicies({
    super.key,
    required this.shortlet,
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
        ...shortlet.houseRules.map(
          (rule) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomShortPolicyTab(
                policyMainText: rule.name,
                subText: rule.isActive.value ? rule.yesText : rule.noText,
              ),
            );
          },
        )
      ],
    );
  }
}
