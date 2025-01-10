import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_vehicle_detail_tab.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';

class BoatDetailsPanel extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const BoatDetailsPanel({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: CustomColumn(
        children: [
          ...boatCruise.boatCruiseDetails.map((e)=> CustomVehicleOrBoatDetailTab(
            attribute: e.name,
            attributeValue: e.detailCount.value.toString(),
          ),)
        
        ],
      ),
    );
  }
}
