import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/common/widgets/custom_share.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_booking_view.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_type_details_model.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/policy_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/reviews_panel.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/safety_features_panel.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import 'widgets/boat_details_panel.dart';
import 'widgets/custom_boat_cruise_details_first_section.dart';
import 'widgets/sailor_service_panel.dart';

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
  final List<BoatTypeDetailsModel> boatDetails = [
    ...LocalDatabase.boatTypeDetails
  ];
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
        padding: EdgeInsets.zero,
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

                  ExpansionPanelList(
                    elevation: 0,
                    dividerColor:
                        AppColors.appTextFadedColor.withValues(alpha: 0.3),
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        boatDetails[panelIndex].isExpanded = isExpanded;
                      });
                    },
                    children: boatDetails
                        .map<ExpansionPanel>(
                          (BoatTypeDetailsModel carDetail) => ExpansionPanel(
                            backgroundColor: AppColors.appWhiteColor,
                            headerBuilder: (context, value) {
                              return ListTile(
                                title: Text(carDetail.name),
                                subtitle: Text(carDetail.subText),
                                isThreeLine: true,
                              );
                            },
                            body: _buildExpandedBodyUi(carDetail.name),
                            isExpanded: carDetail.isExpanded,
                          ),
                        )
                        .toList(),
                  )
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

Widget _buildExpandedBodyUi(String name) {
  switch (name) {
    case "Boat details":
      return const BoatDetailsPanel();

    case "Safety features":
      return const SafetyFeaturesPanel();
    case "Policy":
      return const PolicyTab();

    case "Sailor services":
      return const SailorServicePanel();

    case "Reviews":
      return const ReviewsPanel();

    default:
      return Container();
  }
}
