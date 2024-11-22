import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/car_rental_details_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_car_rental_package.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomCarRentalPackages extends StatelessWidget {
  final List<CarRentalModelxxxxxxxxxxx> carRentals;
  const CustomCarRentalPackages({
    super.key,
    required this.carRentals,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListview(
      itemCount: carRentals.length,
      seperatedBuilderHeight: 25,
      itemBuilder: (_, index) {
        final carRentalItem = carRentals[index];

        return SingleCarRentalPackage(
          onTap: () => AppNagivator.pushRoute(
            context,
            (context) => CarRentalDetailsView(carRental: carRentalItem),
          ),
          carRental: carRentalItem,
        );
      },
    );
  }
}
