import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';

import '../../../../../host_menu/listings/model/car_rental_model.dart';
import 'custom_details_text_tab.dart';

class SafetyFeaturesPanel extends StatelessWidget {
  final CarRentalModel carRental;
  const SafetyFeaturesPanel({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          ...carRental.safetyFeatures
              .map((e) => CustomDetailsTextTab(
                    mainText: e.name,
                  ))
              
          // CustomDetailsTextTab(
          //   mainText:
          //       "Advanced Driver Assistance System (ADAS) with features like Traffic-Aware Cruise Control, Autosteer, and Auto Lane Change",
          // ),
          // SizedBox(height: 15),
          // CustomDetailsTextTab(
          //   mainText:
          //       "Collision Avoidance Assist with automatic emergency braking and pedestarin detection",
          // ),
          // SizedBox(height: 15),
          // CustomDetailsTextTab(
          //   mainText: "Blind Spot Monitoring and Lane Departure Warning",
          // ),
          // SizedBox(height: 15),
          // CustomDetailsTextTab(
          //   mainText:
          //       "360-degree Surround View Camera System for enhanced visibility",
          // ),
        ],
      ),
    );
  }
}
