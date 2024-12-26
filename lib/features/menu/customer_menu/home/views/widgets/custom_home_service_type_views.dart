import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/common/widgets/custom_section_header.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/see_more_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_shortlet_car_or_boat_type_item.dart';
import 'package:tizela/setup/app_navigator.dart';

import 'custom_see_more_item.dart';

class CustomHomeServiceTypeViews extends StatelessWidget {
  const CustomHomeServiceTypeViews({
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
              ? "Discover new favourite stay"
              : isCarRentalSelected
                  ? "Car type"
                  : isBoatCruiseSelected
                      ? "Boat types"
                      : "",
          onTapSeeAll: chooseSeeAll,
        ),
        const CustomHeight(height: 15),
        if (isStaySelected)
          SizedBox(
            height: 105,
            child: CustomListview(
              itemCount: LocalDatabase.shortletTypes.length,
              scrollDirection: Axis.horizontal,
              seperatedBuilderWidth: 15.0,
              itemBuilder: (_, index) {
                final shortletType = LocalDatabase.shortletTypes[index];

                return CustomShortletCarOrBoatTypeItem(
                  itemIcon: shortletType.imageUrl,
                  itemName: shortletType.name,
                );
              },
            ),
          ),
        if (isCarRentalSelected)
          SizedBox(
            height: 105,
            child: CustomListview(
              itemCount: LocalDatabase.carTypes.length,
              scrollDirection: Axis.horizontal,
              seperatedBuilderWidth: 15.0,
              itemBuilder: (_, index) {
                final carType = LocalDatabase.carTypes[index];

                return CustomShortletCarOrBoatTypeItem(
                  itemIcon: carType.imageUrl,
                  itemName: carType.name,
                );
              },
            ),
          ),
        if (isBoatCruiseSelected)
          SizedBox(
            height: 105,
            child: CustomListview(
              itemCount: LocalDatabase.boatTypes.length,
              scrollDirection: Axis.horizontal,
              seperatedBuilderWidth: 15.0,
              itemBuilder: (_, index) {
                final boatType = LocalDatabase.boatTypes[index];

                return CustomShortletCarOrBoatTypeItem(
                  itemIcon: boatType.imageUrl,
                  itemName: boatType.boatName,
                );
              },
            ),
          ),
      ],
    );
  }

  void chooseSeeAll() {
    if (isStaySelected) {
      AppNagivator.pushRoute(
        SeeMoreView(
          headingText: "All favourite stay",
          subText:
              "Here is the comprehensive list of all your favourite \nplaces to stay, curated just for you",
          itemCount: LocalDatabase.shortletTypes.length,
          itemBuilder: (context, index) {
            final shortletType = LocalDatabase.shortletTypes[index];
            return CustomSeeMoreItem(
              imageUrl: shortletType.imageUrl,
              name: shortletType.name,
            );
          },
        ),
      );
    }

    if (isCarRentalSelected) {
      AppNagivator.pushRoute(
        SeeMoreView(
          headingText: "All car brands",
          subText:
              "Here's a list of all the car brands available for you \nto choose from",
          itemCount: LocalDatabase.carTypes.length,
          itemBuilder: (context, index) {
            final carType = LocalDatabase.carTypes[index];
            return CustomSeeMoreItem(
              imageUrl: carType.imageUrl,
              name: carType.name,
            );
          },
        ),
      );
    }

    if (isBoatCruiseSelected) {
      AppNagivator.pushRoute(
        SeeMoreView(
          headingText: "All boat types",
          subText:
              "Here's a list of all the boat types available for you \nto choose from",
          itemCount: LocalDatabase.boatTypes.length,
          itemBuilder: (context, index) {
            final boatType = LocalDatabase.boatTypes[index];
            return CustomSeeMoreItem(
              imageUrl: boatType.imageUrl,
              name: boatType.boatName,
            );
          },
        ),
      );
    }
  }
}
