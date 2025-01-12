import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_booking_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/reviews_panel.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import 'widgets/boat_details_panel.dart';
import 'widgets/custom_boat_cruise_details_first_section.dart';
import 'widgets/custom_details_text_tab.dart';

class BoatCruiseDetailsView extends StatefulWidget {
  const BoatCruiseDetailsView({
    super.key,
    required this.boatCruiseItem,
  });
  final BoatCruiseModel boatCruiseItem;

  @override
  State<BoatCruiseDetailsView> createState() => _BoatCruiseDetailsViewState();
}

class _BoatCruiseDetailsViewState extends State<BoatCruiseDetailsView> {
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
                  networkImageUrl: widget.boatCruiseItem.boatImages.first,
                  fit: BoxFit.cover,
                  imageWidth: context.screenWidth(),
                  imageHeigth: context.screenHeight() * 0.40,
                ),
                //back button
                Positioned(
                  top: 40,
                  left: 10,
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
                  right: 10,
                  top: 40,
                  child: CustomFavourite(
                    onTap: () {},
                    color: Colors.grey.withValues(alpha: 0.5),
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
                    text: widget.boatCruiseItem.boatImages.length.toString(),
                    onTap: () {
                      // AppNagivation.pushRoute(
                      //   context,
                      //   (context) => MoreCarRentalImagesView(
                      //     carRental: widget.carRental,
                      //   ),
                      // );
                    },
                  ),
                )
              ],
            ),

            //
            CustomScrollableLayoutWidget(
              padding: const EdgeInsets.only(
                  top: 13.5, left: 13.5, right: 13.5, bottom: 35),
              child: CustomColumn(
                isMainAxisSize: false,
                children: [
                  //name and rating
                  CustomBoatCruiseDetailsFirstSection(
                    boatCruiseItem: widget.boatCruiseItem,
                  ),
                  const CustomDivider(),
                  const CustomHeight(height: 30),
                  CustomExpansionTile(
                    title: "Vehical Details",
                    subtitle: "See amazing vehicle details",
                    children: [
                      BoatDetailsPanel(
                        boatCruise: widget.boatCruiseItem,
                      )
                    ],
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    title: "Safety features",
                    subtitle: "Prioritize your safety on your cruise",
                    children: widget.boatCruiseItem.boatSafetyFeatures
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
                    children: widget.boatCruiseItem.boatPolicies
                        .map((e) => CustomDetailsTextTab(
                              mainText: e.name,
                            ))
                        .toList(),
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    childrenPadding: 17,
                    title: "Sailor services",
                    subtitle:
                        "Specify additional services offered by the sailor",
                    children: widget.boatCruiseItem.boatSailorPolicies
                        .map((e) => CustomDetailsTextTab(
                              mainText: e.name,
                            ))
                        .toList(),
                    onExpansionChanged: (value) =>
                        setState(() => isExpanded = value),
                  ),
                  CustomExpansionTile(
                    title: "Reviews",
                    subtitle:
                        "See what other users say about the service offered",
                    children: [
                      ReviewsPanel(
                        reviewCount: widget.boatCruiseItem.ratingsCount,
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
              BoatCruiseBookingView(
                boatCruise: widget.boatCruiseItem,
              ),
            );
          },
          text: "Book",
        ),
      ),
    );
  }
}
