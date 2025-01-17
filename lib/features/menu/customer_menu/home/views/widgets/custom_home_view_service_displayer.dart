import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/controller/customer_home_controller.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_boat_cruise_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_car_rental_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_selectable_location_tab_item.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_shortlet_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tabs.dart';


class CustomHomeViewServiceDisplayer extends StatelessWidget {
  const CustomHomeViewServiceDisplayer({
    super.key,
    required this.isStaySelected,
    required this.isCarRentalSelected,
    required this.isBoatCruiseSelected,
  });

  final bool isStaySelected;
  final bool isCarRentalSelected;
  final bool isBoatCruiseSelected;

  @override
  Widget build(BuildContext context) {
    final controller = CustomerHomeController.instance;
  

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        //section 1
        CustomSectionHeader(
          mainText: isStaySelected
              ? "See guest favourite stay"
              : isCarRentalSelected || isBoatCruiseSelected
                  ? "See available locations"
                  : "",
          showViewAll: false,
        ),
        const CustomHeight(height: 15),

        //section 2: location tabs
        if (isStaySelected)
          CustomTabs(
            itemCount: LocalDatabase.locations.length,
            itemBuilder: (_, index) {
              final location = LocalDatabase.locations[index];
              return Obx(
                () {
                  final isSelected = location.toLowerCase() ==
                      controller.defaultShortletLocation.value.toLowerCase();
                  return CustomSelectableLocationTabItem(
                    isSelected: isSelected,
                    location: location,
                    onTabSelected: () =>
                        controller.updateShortletLocationTab(location),
                  );
                },
              );
            },
          ),
        if (isCarRentalSelected)
          CustomTabs(
            itemCount: LocalDatabase.locations.length,
            itemBuilder: (_, index) {
              final location = LocalDatabase.locations[index];
              return Obx(
                () {
                  final isSelected = location.toLowerCase() ==
                      controller.defaultCarRentalLocation.value.toLowerCase();
                  return CustomSelectableLocationTabItem(
                    isSelected: isSelected,
                    location: location,
                    onTabSelected: () =>
                        controller.updateCarRentalLocationTab(location),
                  );
                },
              );
            },
          ),
        if (isBoatCruiseSelected)
          CustomTabs(
            itemCount: LocalDatabase.locations.length,
            itemBuilder: (_, index) {
              final location = LocalDatabase.locations[index];
              return Obx(
                () {
                  final isSelected = location.toLowerCase() ==
                      controller.defaultBoatCruiseLocation.value.toLowerCase();
                  return CustomSelectableLocationTabItem(
                    isSelected: isSelected,
                    location: location,
                    onTabSelected: () =>
                        controller.updateBoatCruiseLocationTab(location),
                  );
                },
              );
            },
          ),
        const CustomHeight(height: 15),

        //section 3: services
        isStaySelected
            ? CustomShortletPackages(
                shortlets: controller.allShortlets,
              )
            : isCarRentalSelected
                ? CustomCarRentalPackages(
                    carRentals: controller.allCarRentals,
                  )
                : isBoatCruiseSelected
                    ? CustomBoatCruisePackages(
                        boatCruise: controller.allBoatCruises)
                    : const SizedBox.shrink(),
      ],
    );
  }
}
