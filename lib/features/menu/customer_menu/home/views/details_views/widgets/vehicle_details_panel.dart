import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';

import '../../../../../host_menu/listings/model/car_rental_model.dart';
import 'custom_vehicle_detail_tab.dart';

class VehicleDetailsPanel extends StatelessWidget {
  final CarRentalModel carRental;
  const VehicleDetailsPanel({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          ...carRental.carRentalDetails
              .map((e) => CustomVehicleOrBoatDetailTab(
                    attribute: e.name,
                    attributeValue: e.detailCount.value.toString(),
                  ))
              ,
          // const CustomVehicleOrBoatDetailTab(
          //   attribute: "Model:",
          //   attributeValue: "Tesla Model S",
          // ),
          // const CustomVehicleOrBoatDetailTab(
          //   attribute: "Year:",
          //   attributeValue: "2023",
          // ),
          // const CustomVehicleOrBoatDetailTab(
          //   attribute: "Color",
          //   attributeValue: "Midnight Silver Metallic",
          // ),
          // const CustomVehicleOrBoatDetailTab(
          //   attribute: "Seating Capacity",
          //   attributeValue:
          //       "4 Adults + 2 Children (with optional rear-facing seats)",
          // ),
          CustomOutlinedButton(actionText: "Show all", onTap: () {})
        ],
      ),
    );
  }
}
