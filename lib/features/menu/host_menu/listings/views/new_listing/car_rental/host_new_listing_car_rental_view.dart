import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_car_rental_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_new_listing_car_details.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_new_listing_car_rental_address.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_new_listing_car_rental_description.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_new_listing_car_rental_price_set.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/new_listing_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_slider_indicators_page_view.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';

class HostNewListingCarRentalView extends StatelessWidget {
  const HostNewListingCarRentalView({super.key});

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController carRentalController =
        HostCarRentalController.instance;

    //
    return Scaffold(
      body: CustomColumn(
        children: [
          //slider indicators
          Obx(
            () {
              return CustomSliderIndicatorsPageView(
                currentSelectedPage:
                    carRentalController.currentSelectedPageIndex.value,
              );
            },
          ),

          //view by slider
          Expanded(
            child: PageView(
              controller: carRentalController.carRentalCreationPageController,
              onPageChanged: (newValue) =>
                  AppFunctions.onCurrentPageIndexChanged(
                newPageIndex: newValue,
                currentSelectedPageIndex:
                    carRentalController.currentSelectedPageIndex,
              ),
              children: const [
                CustomNewListingCarRentalDescription(),
                CustomNewListingCarRentalAddress(),
                CustomNewListingCarRentalPriceSet(),
                CustomNewListingCarRentalAvailabilityAndTime(),
                CustomNewListingCarDetails(),
                CustomNewListingCarRentalCreationRules(),
                CustomNewListingCarRentalAddImages()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNewListingCreationBNB(
        onSave: carRentalController.createNewCarRental,
        onExit: () => AppNagivator.goBack(context),
      ),
    );
  }
}
