import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_section_header.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/see_more.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomHomeViewSection2 extends StatelessWidget {
  const CustomHomeViewSection2({
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
          onTapSeeAll: () => chooseSeeAll(context),
        ),
        const CustomHeight(height: 15),
        // CustomHorizontalViewRoundedTabs(
        //   serviceType: isStaySelected
        //       ? LocalDatabase.stayType
        //       : isCarRentalSelected
        //           ? LocalDatabase.carTypes
        //           : isBoatCruiseSelected
        //               ? LocalDatabase.boatTypes
        //               : [],
        // ),
      ],
    );
  }

  void chooseSeeAll(BuildContext context) {
    if (isStaySelected) {
      AppNagivator.pushRoute(
        context,
        (context) => SeeMoreView(
            headingText: "All favourite stay",
            subText:
                "Here is the comprehensive list of all your favourite \nplaces to stay, curated just for you",
            serviceType: LocalDatabase.stayType),
      );
    }

    if (isCarRentalSelected) {
      AppNagivator.pushRoute(
        context,
        (context) => SeeMoreView(
            headingText: "All car brands",
            subText:
                "Here's a list of all the car brands available for you \nto choose from",
            serviceType: LocalDatabase.carTypes),
      );
    }

    if (isBoatCruiseSelected) {
      AppNagivator.pushRoute(
        context,
        (context) => SeeMoreView(
            headingText: "All boat types",
            subText:
                "Here's a list of all the boat types available for you \nto choose from",
            serviceType: LocalDatabase.boatTypes),
      );
    }
  }
}
