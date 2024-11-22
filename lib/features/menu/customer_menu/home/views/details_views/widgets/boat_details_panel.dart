import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_vehicle_detail_tab.dart';

class BoatDetailsPanel extends StatelessWidget {
  const BoatDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          CustomVehicleOrBoatDetailTab(
            attribute: "Model:",
            attributeValue: "Tesla Model S",
          ),
          CustomVehicleOrBoatDetailTab(
            attribute: "Year:",
            attributeValue: "2023",
          ),
          CustomVehicleOrBoatDetailTab(
            attribute: "Color",
            attributeValue: "Midnight Silver Metallic",
          ),
          CustomVehicleOrBoatDetailTab(
            attribute: "Seating Capacity",
            attributeValue:
                "4 Adults + 2 Children (with optional rear-facing seats)",
          ),
        ],
      ),
    );
  }
}
