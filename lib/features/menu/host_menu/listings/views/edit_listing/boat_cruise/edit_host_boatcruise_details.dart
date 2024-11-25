import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/boat_cruise/widgets/boat_cruise_edits_imports.dart';
import '../../../../../../../common/styles/custom_bulliet_point_with_text.dart';
import '../../../../../../../common/styles/styles.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/images_texts.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../widgets/custom_image_displayer.dart';
import '../widgets/custom_listing_details_displayer.dart';
import '../widgets/custom_main_and_subtext_listing_details.dart';
import '../widgets/custom_shorlet_apartment_details_section.dart';
import '../widgets/host_listing_details_view.dart';

class EditHostBoatcruiseDetails extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditHostBoatcruiseDetails({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final boats = [
      ...LocalDatabase.boatCruise,
      ...LocalDatabase.boatCruise,
    ];
    return HostListingDetailsView(
      onSearchTap: () {},
      child: CustomColumn(
        children: [
          //Boat name
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Boat name",
            data: "Bavaria 30 Cruiser (2006)",
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseNameView(),
            ),
          ),

          //Uploaded Photos
          CustomListingDetailsDisplayer(
            titleName: "Uploaded Photos",
            isJustText: false,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: boats.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 90,
              ),
              itemBuilder: (_, index) {
                final boat = boats[index];
                return CustomImageDisplayer(
                  imageUrl: boat,
                  size: 80,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseImagesView(),
            ),
          ),

          //Listing description
          CustomListingDetailsDisplayer(
            titleName: "Listing description",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Boat type",
                  value: "Yacht",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Boat name",
                  value: "Bavaria 30 Cruiser (2006)",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Boat details",
                  value:
                      "Lorem ipsum dolor sit amet consectetur. Sagittis aliquet nunc nisi posuere diam tristique nam. Nunc sit.",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseDescription(),
            ),
          ),

          //location
          CustomListingDetailsDisplayer(
            titleName: "Location",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Address",
                  value: "No 23 Kosoko road, Ojudu Berger",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Local gov.t",
                  value: "Ojudu",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "State",
                  value: "Lagos",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Postal code",
                  value: "124876",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Building details",
                  value: "Flat 2",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseLocation(),
            ),
          ),

          //Boat fee
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Boat fee",
            isJustText: false,
            child: Text.rich(
              TextSpan(
                children: [
                  customTextSpan(
                    text: "#50,000",
                    color: AppColors.appMainColor,
                  ),
                  customTextSpan(
                    text: "/ per hour",
                    color: AppColors.appMainColor,
                    fontweight: FontWeight.normal,
                    fontsize: 14,
                  )
                ],
              ),
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseFee(),
            ),
          ),

          //set availability
          CustomListingDetailsDisplayer(
            titleName: "Set Availability",
            isJustText: false,
            child: Row(
              children: [
                const CustomImageDisplayer(
                  imageUrl: ImagesText.calenderGreyIcon,
                  size: 18,
                ),
                const CustomWidth(width: 5),
                Text(
                  "May 15th - Apr 20th",
                  style: customTextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: AppColors.appTextFadedColor,
                  ),
                )
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseAvailability(),
            ),
          ),

          //boat details
          CustomListingDetailsDisplayer(
            titleName: "Boat details",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Passengers:",
                  value: "3",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseDetailsView(),
            ),
          ),

          //Features
          CustomListingDetailsDisplayer(
            titleName: "Features",
            isJustText: false,
            child: CustomColumn(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Air Conditioning",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Bluetooth Connectivity",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Navigation System",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Sunroof/Moonroof",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Leather Seats",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Apple CarPlay/Android Auto",
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseFeatures(),
            ),
          ),

          //Safety features
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Safety features",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomBullietPointWithText(
                  text:
                      "Advanced Driver Assistance System (ADAS) with features like Traffic-Aware Cruise Control, Autosteer, and Auto Lane Change.",
                ),
                CustomBullietPointWithText(
                  text:
                      "Collision Avoidance Assist with automatic emergency braking and pedestrian detection.",
                )
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseSafetyFeatures(),
            ),
          ),

          //Boat policies
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Boat policies",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomBullietPointWithText(
                  text:
                      "Cancellation made 24 hours or more before the scheduled pick-up time incur no penalty.",
                ),
                CustomBullietPointWithText(
                  text:
                      "Cancellation made less than 24 hours before the scheduled pick-up time may incur a cancellation fee equivalent to a percentage of the total rental cost.",
                )
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruisePolicies(),
            ),
          ),

          //Sailors service
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Sailor services",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomBullietPointWithText(
                  text:
                      "Cancellation made 24 hours or more before the scheduled pick-up time incur no penalty.",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditBoatCruiseSailorsServices(),
            ),
          ),
        ],
      ),
    );
  }
}
