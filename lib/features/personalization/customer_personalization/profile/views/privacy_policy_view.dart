import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_privacy_policy.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    const privacyPolicies = LocalDatabase.privacyPolicies;
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            const CustomHeaderSubAndBackButton(
              headerText: "Privacy policy",
              isthereSubText: false,
            ),
            const CustomHeight(height: 10),
            ListView.separated(
              itemCount: privacyPolicies.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final policy = privacyPolicies[index];
                return CustomPrivacyPolicy(privacyPolicy: policy);
              },
              separatorBuilder: (_, __) => const CustomHeight(height: 20),
            )
          ],
        ),
      ),
    );
  }
}
