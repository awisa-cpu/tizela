import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_expansion_tile.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/common/widgets/custom_share.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';
import '../../../bookings/views/car_rental_bookings/car_rental_bookings_view.dart';
import '../../../favourite/controller/custom_car_rental_favourite_controller.dart';
import 'widgets/custom_details_text_tab.dart';
import 'widgets/custom_first_section_car_rental_details_view.dart';
import 'widgets/reviews_panel.dart';
import 'widgets/vehicle_details_panel.dart';

class CarRentalDetailsView extends StatefulWidget {
  final CarRentalModel carRental;
  const CarRentalDetailsView({super.key, required this.carRental});

  @override
  State<CarRentalDetailsView> createState() => _CarRentalDetailsViewState();
}

class _CarRentalDetailsViewState extends State<CarRentalDetailsView> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    AppDeviceServices.hideStatusBar();
  }

  @override
  void dispose() {
    AppDeviceServices.restoreStatusBar();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final favController = CustomCarRentalFavouriteController.instance;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.only(bottom: 15),
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //image and image qualities
            Stack(
              children: [
                CustomCachedNetworkImage(
                  networkImageUrl: widget.carRental.carImages.first,
                  imageWidth: context.screenWidth(),
                  imageHeigth: context.screenHeight() * 0.40,
                  fit: BoxFit.cover,
                ),
                //back button
                Positioned(
                  left: 10,
                  top: 40,
                  child: IconButton(
                    onPressed: () => AppNagivator.goBack(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ),
                //favourite
                Positioned(
                  top: 40,
                  right: 10,
                  child: Obx(
                    () => CustomFavourite(
                      onTap: () =>
                          favController.addOrRemoveFromCarRentalFavourites(
                              carRentalId: widget.carRental.uid!),
                      color: favController.isAdded(
                              carRentalId: widget.carRental.uid!)
                          ? Colors.red
                          : null,
                    ),
                  ),
                ),
                //share
                Positioned(
                  right: 60,
                  top: 40,
                  child: CustomShare(
                    onTap: () {},
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CustomIconAndText(
                    text: widget.carRental.carImages.length.toString(),
                    onTap: () {
                      // AppNagivator.pushRoute(
                      //   MoreCarRentalImagesView(
                      //     carRental: widget.carRental,
                      //   ),
                      // );
                    },
                  ),
                )
              ],
            ),

            //section 2
            CustomScrollableLayoutWidget(
              padding: const EdgeInsets.only(
                  top: 13.5, left: 13.5, right: 13.5, bottom: 35),
              child: CustomColumn(
                isMainAxisSize: false,
                children: [
                  CustomFirstSectionCarRentalDetailsView(
                    carRental: widget.carRental,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: CustomDivider(),
                  ),
                  CustomExpansionTile(
                    title: "Vehical Details",
                    subtitle: "See amazing vehicle details",
                    children: [
                      VehicleDetailsPanel(
                        carRental: widget.carRental,
                      )
                    ],
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    title: "Safety features",
                    subtitle: "Prioritize your safety on your trip",
                    children: widget.carRental.safetyFeatures
                        .map((e) => CustomDetailsTextTab(
                              mainText: e.name,
                            ))
                        .toList(),
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    title: "Policy",
                    subtitle: "We have your best interest at heart",
                    children: widget.carRental.carPolicies
                        .map((e) => CustomDetailsTextTab(
                              mainText: e.name,
                            ))
                        .toList(),
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    childrenPadding: 17,
                    title: "Driver services",
                    subtitle:
                        "Specify additional services offered by the driver",
                    children: widget.carRental.driverPolicies
                        .map((e) => CustomDetailsTextTab(
                              mainText: e.name,
                            ))
                        .toList(),
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    title: "Reviews",
                    subtitle: "See what other users say the service offered",
                    children: [
                      ReviewsPanel(
                        reviewCount: widget.carRental.ratingsCount,
                      )
                    ],
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: context.screenWidth() * 0.90,
        child: CustomEleButton(
            onPressed: () {
              AppNagivator.pushRoute(
                CarRentalBookingsView(carRental: widget.carRental),
              );
            },
            text: "Book"),
      ),
    );
  }
}
