import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/boat_cruise_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_boat_cruise.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../controller/customer_home_controller.dart';

class CustomBoatCruisePackages extends StatelessWidget {
  final List<BoatCruiseModel> boatCruise;
  const CustomBoatCruisePackages({
    super.key,
    required this.boatCruise,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CustomerHomeController.instance;

    //
    return Obx(
      () {
        return controller.areBoatCruiseLoading.value
            ? const CustomHostDataShimmerListView()
            : CustomListview(
                seperatedBuilderHeight: 30.0,
                scrollDirection: Axis.vertical,
                itemCount: boatCruise.length,
                itemBuilder: (_, index) {
                  final boatCruiseItem = boatCruise[index];

                  return SingleBoatCruise(
                    onTap: () => AppNagivator.pushRoute(
                      BoatCruiseDetailsView(
                        boatCruiseItem: boatCruiseItem,
                      ),
                    ),
                    boatCruse: boatCruiseItem,
                  );
                },
              );
      },
    );
  }
}
