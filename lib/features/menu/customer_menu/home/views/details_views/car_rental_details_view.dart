import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/common/widgets/custom_share.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_details_model.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';
import '../../../bookings/views/car_rental_bookings/car_rental_bookings_view.dart';
import 'widgets/custom_first_section_car_rental_details_view.dart';
import 'widgets/driver_service_panel.dart';
import 'widgets/policy_tab.dart';
import 'widgets/reviews_panel.dart';
import 'widgets/safety_features_panel.dart';
import 'widgets/vehicle_details_panel.dart';

class CarRentalDetailsView extends StatefulWidget {
  final CarRentalModel carRental;
  const CarRentalDetailsView({super.key, required this.carRental});

  @override
  State<CarRentalDetailsView> createState() => _CarRentalDetailsViewState();
}

class _CarRentalDetailsViewState extends State<CarRentalDetailsView> {
  final List<CarTypeDetailsModel> carDetails = [
    ...LocalDatabase.carTypeDetails
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
                  networkImageUrl: widget.carRental.carImages.first,
                  imageWidth: context.screenWidth(),
                  imageHeigth: context.screenHeight() * 0.40,
                  fit: BoxFit.cover,
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
                    text: "12",
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

                  //todo: work with the model data
                  ExpansionPanelList(
                    elevation: 0,
                    dividerColor:
                        AppColors.appTextFadedColor.withValues(alpha: 0.3),
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        carDetails[panelIndex].isExpanded = isExpanded;
                      });
                    },
                    children: carDetails
                        .map<ExpansionPanel>(
                          (CarTypeDetailsModel carDetail) => ExpansionPanel(
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
                CarRentalBookingsView(carRental: widget.carRental),
              );
            },
            text: "Book"),
      ),
    );
  }
}

Widget _buildExpandedBodyUi(String name) {
  switch (name) {
    case "Vehicle details":
      return const VehicleDetailsPanel();

    case "Safety features":
      return const SafetyFeaturesPanel();
    case "Policy":
      return const PolicyTab();

    case "Driver service":
      return const DriverServicePanel();

    case "Reviews":
      return const ReviewsPanel();

    default:
      return Container();
  }
}
