import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/car_rental_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_car_rental.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';
import '../../controller/customer_home_controller.dart';

class CustomCarRentalPackages extends StatelessWidget {
  final List<CarRentalModel> carRentals;
  const CustomCarRentalPackages({
    super.key,
    required this.carRentals,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CustomerHomeController.instance;

    //
    return Obx(
      () {
        return controller.areCarRentalsLoading.value
            ? const CustomHostDataShimmerListView()
            : CustomListview(
                itemCount: carRentals.length,
                seperatedBuilderHeight: 30.0,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  final carRentalItem = carRentals[index];

                  return SingleCarRental(
                    onTap: () => AppNagivator.pushRoute(
                      CarRentalDetailsView(carRental: carRentalItem),
                    ),
                    carRental: carRentalItem,
                  );
                },
              );
      },
    );
  }
}
