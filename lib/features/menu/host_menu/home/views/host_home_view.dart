import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_home_header_section.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/boatcruise/custom_boat_cruise_stat_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/boatcruise/custom_boat_cruise_home_data_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/carrental/custom_car_rental_home_data_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/carrental/custom_car_rental_stat_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_home_confirmation_card.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/shortlets/custom_shortlet_home_data_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/shortlets/custom_shortlet_home_stat_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_tab_button_with_icon_and_text.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:get/get.dart';

import '../controllers/host_boat_cruise_home_controller.dart';
import '../controllers/host_car_rental_home_controller.dart';
import '../controllers/host_home_controller.dart';
import '../controllers/host_shortlet_home_controller.dart';

class HostHomeView extends StatelessWidget {
  const HostHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HostHomeController());
    Get.put(HostShortletHomeController());
    Get.put(HostCarRentalHomeController());
    Get.put(HostBoatCruiseHomeController());
    final homeController = HostHomeController.instance;
    final shortletHomeCon = HostShortletHomeController.instance;
    final carRentalHomeCon = HostCarRentalHomeController.instance;
    final boatCruiseHomeCon = HostBoatCruiseHomeController.instance;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          children: [
            const CustomHeight(height: 50),

            ///section 1
            const CustomHomeHeaderSection(
              userType: "Host",
            ),
            const CustomHeight(height: 30),

            //view for listing indication
            // if (updateDetails) const CustomHostHomeListingIndication(),

            //selection 2: Selectable tabs||controlled by home Controller
            Obx(
              () => CustomColumn(
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomTabButtonWithIconAndText(
                          text: "Shorlet",
                          imageUrl: ImagesText.buildingIcon,
                          textIconAndBorderColor:
                              homeController.shorletTextAndIconColor.value,
                          mainColor:
                              homeController.shorletmainAndBorderColor.value,
                          onTap: homeController.onShorletChange,
                        ),
                        CustomTabButtonWithIconAndText(
                          text: "Car rental",
                          imageUrl: ImagesText.carIcon,
                          textIconAndBorderColor:
                              homeController.carRentalTextAndIconColor.value,
                          mainColor:
                              homeController.carRentalmainAndBorderColor.value,
                          onTap: homeController.onCarRentalChange,
                        ),
                        CustomTabButtonWithIconAndText(
                          text: "Boat cruise",
                          imageUrl: ImagesText.shipIcon,
                          textIconAndBorderColor:
                              homeController.boatCruiseTextAndIconColor.value,
                          mainColor:
                              homeController.boatCruisemainAndBorderColor.value,
                          onTap: homeController.onBoatCruiseChange,
                        ),
                      ],
                    ),
                  ),
                  const CustomHeight(height: 35),
                ],
              ),
            ),

            //section 3: confirmation card
            Obx(
              () {
                if (homeController.isShorletSelected.value) {
                  return shortletHomeCon
                          .showShortletAvailabilityConfirmation.value
                      ? CustomHostHomeConfirmationCard(
                          onTapNoEditAvailability:
                              shortletHomeCon.onTapNoEditShortletAvailability,
                          onTapYesConfirmAvailability: shortletHomeCon
                              .onTapYesConfirmShortletAvailability,
                        )
                      : const CustomHeight();
                } else if (homeController.isCarRentalSelected.value) {
                  return carRentalHomeCon
                          .showCarRentalAvailabilityConfirmation.value
                      ? CustomHostHomeConfirmationCard(
                          onTapNoEditAvailability:
                              carRentalHomeCon.onTapNoEditCarRentalAvailability,
                          onTapYesConfirmAvailability: carRentalHomeCon
                              .onTapYesConfirmCarRentalAvailability,
                        )
                      : const CustomHeight();
                } else if (homeController.isBoatCruiseSelected.value) {
                  return boatCruiseHomeCon
                          .showBoatCruiseAvailabilityConfirmation.value
                      ? CustomHostHomeConfirmationCard(
                          onTapNoEditAvailability: boatCruiseHomeCon
                              .onTapNoEditBoatCruiseAvailability,
                          onTapYesConfirmAvailability: boatCruiseHomeCon
                              .onTapYesConfirmBoatCruiseAvailability,
                        )
                      : const CustomHeight();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),

            ///section 4: statictics
            Obx(
              () {
                return homeController.isShorletSelected.value
                    ? const CustomShortletHomeStatView()
                    : homeController.isCarRentalSelected.value
                        ? const CustomCarRentalStatView()
                        : homeController.isBoatCruiseSelected.value
                            ? const CustomBoatCruiseStatView()
                            : const SizedBox.shrink();
              },
            ),

            ///section 5: action data
            Obx(
              () {
                if (homeController.isShorletSelected.value) {
                  return const CustomShortletHomeDataView();
                } else if (homeController.isCarRentalSelected.value) {
                  return const CustomCarRentalHomeDataView();
                } else if (homeController.isBoatCruiseSelected.value) {
                  return const CustomBoatCruiseHomeDataView();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
