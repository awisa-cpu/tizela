import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';

import 'custom_details_text_tab.dart';

class SafetyFeaturesPanel extends StatelessWidget {
  const SafetyFeaturesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          CustomDetailsTextTab(
            mainText:
                "Advanced Driver Assistance System (ADAS) with features like Traffic-Aware Cruise Control, Autosteer, and Auto Lane Change",
          ),
          SizedBox(height: 15),
          CustomDetailsTextTab(
            mainText:
                "Collision Avoidance Assist with automatic emergency braking and pedestarin detection",
          ),
          SizedBox(height: 15),
          CustomDetailsTextTab(
            mainText: "Blind Spot Monitoring and Lane Departure Warning",
          ),
          SizedBox(height: 15),
          CustomDetailsTextTab(
            mainText:
                "360-degree Surround View Camera System for enhanced visibility",
          ),
        ],
      ),
    );
  }
}
