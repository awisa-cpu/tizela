import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/custom_new_listing_shorlet_add_images.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/custom_new_listing_shorlet_apartment_details.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/custom_new_listing_shorlet_availability_and_time.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/custom_new_listing_shorlet_verification.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/host_new_listing_shorlet_description_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/new_listing_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_slider_indicators_page_view.dart';
import 'package:tizela/setup/setup.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';
import '../../../controllers/host_shorlet_controller.dart';

class HostNewListingShorletView extends StatelessWidget {
  const HostNewListingShorletView({super.key});

  @override
  Widget build(BuildContext context) {
    final HostShorletController hostShorletCon = HostShorletController.instance;

    return Scaffold(
      body: CustomColumn(
        isMainAxisSize: false,
        children: [
          //slider indicators
          Obx(
            () => CustomSliderIndicatorsPageView(
              currentSelectedPage: hostShorletCon.currentPageSelected.value,
            ),
          ),
          //view by slider
          Expanded(
            child: PageView(
              controller: hostShorletCon.shortletCreationPageController,
              onPageChanged: (newValue) =>
                  AppFunctions.onCurrentPageIndexChanged(
                newPageIndex: newValue,
                currentSelectedPageIndex: hostShorletCon.currentPageSelected,
              ),
              children: const [
                //todo: review methods that should be replaced with the appfunction methods

                CustomNewListingShorletDescription(),
                CustomNewListingShorletLocation(),
                CustomNewListingShorletPriceSet(),
                CustomNewListingShorletAvailabilityAndTime(),
                CustomNewListingShorletApartmentDetails(),
                CustomNewListingShorletAddImages(),
                CustomNewListingShorletVerification(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNewListingCreationBNB(
        onSave: () => hostShorletCon.createNewShortletListing(),
        onExit: () => AppNagivator.goBack(context),
      ),
    );
  }
}
