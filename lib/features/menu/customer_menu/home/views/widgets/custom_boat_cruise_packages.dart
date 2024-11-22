import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/boat_cruise_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_boat_cruise_package.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomBoatCruisePackages extends StatelessWidget {
  final List<BoatCruiseModelxxxxxxxx> boatCruise;
  const CustomBoatCruisePackages({
    super.key,
    required this.boatCruise,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListview(
      seperatedBuilderHeight: 25.0,
      itemCount: boatCruise.length,
      itemBuilder: (_, index) {
        final boatCruiseItem = boatCruise[index];

        return SingleBoatCruisePackage(
          onTap: () => AppNagivator.pushRoute(
            context,
            (context) => BoatCruiseDetailsView(
              boatCruiseItem: boatCruiseItem,
            ),
          ),
          boatCruse: boatCruiseItem,
        );
      },
    );
  }
}
