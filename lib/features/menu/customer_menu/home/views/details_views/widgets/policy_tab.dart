import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';

import 'custom_car_rental_policy_tab.dart';

class PolicyTab extends StatelessWidget {
  const PolicyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomCarRentalPolicyTab(
          heading: "Cancellation Policy:",
          policy1:
              "Cancellations made 24 hours or more before the scheduled pick-up time incur no penalty.",
          policy2:
              "Cancellations made less than 24 hours before the scheduled pick-up time may incur a cancellation fee equivalent to a percentage of the total rental cost.",
        ),
        const CustomCarRentalPolicyTab(
          heading: "Late Arrival Policy:",
          policy1:
              "Customers are allowed a grace period of 15 minutes from the scheduled pick-up time. Beyond this, late arrivals may result in additional charges or the cancellation of the booking.",
          policy2:
              "In the event of unexpected delays (e.g., flight delays), customers are advised to notify the rental service as soon as possible to make alternative arrangements.",
        ),
        const CustomCarRentalPolicyTab(
          heading: "Fuel Policy:",
          policy1:
              "Cancellations made 24 hours or more before the scheduled pick-up time incur no penalty.",
          policy2:
              "Cancellations made less than 24 hours before the scheduled pick-up time may incur a cancellation fee equivalent to a percentage of the total rental cost.",
        ),
        CustomOutlinedButton(
          actionText: "Show all",
          onTap: () {},
        )
      ],
    );
  }
}
