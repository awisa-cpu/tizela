import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruise_add_images.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruise_ava_and_time.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruise_description.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruise_location.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruise_price_set.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_cruse_rules.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_new_listing_boat_details.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/new_listing_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_slider_indicators_page_view.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../controllers/host_boat_cruise_controller.dart';

class HostNewListingBoatCruiseView extends StatelessWidget {
  const HostNewListingBoatCruiseView({super.key});

  @override
  Widget build(BuildContext context) {
    final boatCruiseController = HostBoatCruiseController.instance;

    //
    return Scaffold(
      body: CustomColumn(
        children: [
          //slider indicators
          Obx(
            () => CustomSliderIndicatorsPageView(
              currentSelectedPage:
                  boatCruiseController.currentSelectedPageIndex.value,
            ),
          ),

          //view by slider
          Expanded(
            child: PageView(
              controller: boatCruiseController.hostBoatCruisePageCon,
              onPageChanged: (newValue) =>
                  boatCruiseController.onPageViewChanged(newValue),
              children: const [
                CustomNewListingBoatCruiseDescription(),
                CustomNewListingBoatCruiseLocation(),
                CustomNewListingBoatCruisePriceSet(),
                CustomNewListingBoatCruiseAvaAndTime(),
                CustomNewListingBoatDetails(),
                CustomNewListingBoatCruseRules(),
                CustomNewListingBoatCruiseAddImages(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNewListingCreationBNB(
        onSave: () => boatCruiseController.createNewBoatCruise(),
        onExit: () => AppNagivator.goBack(context),
      ),
    );
  }
}
