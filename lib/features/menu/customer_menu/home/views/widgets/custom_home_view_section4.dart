import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_section_header.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_boat_cruise_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_car_rental_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_shortlet_packages.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tabs.dart';

class CustomHomeViewSection4 extends StatelessWidget {
  const CustomHomeViewSection4({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSectionHeader(
          mainText: isStaySelected
              ? "See guest favourite stay"
              : isCarRentalSelected || isBoatCruiseSelected
                  ? "See available locations"
                  : "",
          showViewAll: false,
        ),
        const CustomHeight(height: 15),
        CustomTabs(
          locations: LocalDatabase.locations,
          overflow: TextOverflow.ellipsis,
        ),
        const CustomHeight(height: 15),
        isStaySelected
            ? CustomShorletPackages(
                shortletPackages: LocalDatabase.shortletPackages,
              )
            : isCarRentalSelected
                ? CustomCarRentalPackages(
                    carRentals: LocalDatabase.carRentalPackages)
                : isBoatCruiseSelected
                    ? CustomBoatCruisePackages(
                        boatCruise: LocalDatabase.boatCruisePackages,
                      )
                    : const SizedBox.shrink(),
      ],
    );
  }
}
