import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/common/widgets/custom_share.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_booking_view.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_type_details_model.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/policy_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/reviews_panel.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/safety_features_panel.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import 'widgets/boat_details_panel.dart';
import 'widgets/custom_boat_cruise_details_first_section.dart';
import 'widgets/sailor_service_panel.dart';

class BoatCruiseDetailsView extends StatefulWidget {
  const BoatCruiseDetailsView({
    super.key,
    required this.boatCruiseItem,
  });
  final BoatCruiseModelxxxxxxxx boatCruiseItem;

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
      body: CustomScrollLayoutWidget(
        padding: EdgeInsets.zero,
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //image and image qualities
            Stack(
              children: [
                SizedBox(
                  height: context.screenHeight() * 0.35,
                  width: context.screenWidth(),
                  child: Image.asset(
                    widget.boatCruiseItem.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                //back button
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    onPressed: () => AppNagivator.goBack(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 40,
                  child: CustomFavourite(
                    onTap: () {},
                  ),
                ),
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
                    imageIcon: ImagesText.galleryIcon,
                    text: "12",
                    textStyle: const TextStyle(color: Colors.white),
                    color: Colors.black.withOpacity(0.6),
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
            CustomScrollLayoutWidget(
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
                    dividerColor: AppColors.appTextFadedColor.withOpacity(0.3),
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
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 30),
        width: context.screenWidth() * 0.80,
        child: CustomEleButton(
            onPressed: () {
              AppNagivator.pushRoute(
                context,
                (context) => BoatCruiseBookingView(
                  boatCruise: widget.boatCruiseItem,
                ),
              );
            },
            text: "Book"),
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
