import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';

import 'custom_vehicle_detail_tab.dart';

class VehicleDetailsPanel extends StatelessWidget {
  const VehicleDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          const CustomVehicleOrBoatDetailTab(
            attribute: "Model:",
            attributeValue: "Tesla Model S",
          ),
          const CustomVehicleOrBoatDetailTab(
            attribute: "Year:",
            attributeValue: "2023",
          ),
          const CustomVehicleOrBoatDetailTab(
            attribute: "Color",
            attributeValue: "Midnight Silver Metallic",
          ),
          const CustomVehicleOrBoatDetailTab(
            attribute: "Seating Capacity",
            attributeValue:
                "4 Adults + 2 Children (with optional rear-facing seats)",
          ),
          CustomOutlinedButton(actionText: "Show all", onTap: () {})
        ],
      ),
    );
  }
}
