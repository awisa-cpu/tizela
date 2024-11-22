import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_bulliet_point_with_text.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/car_rental/widgets/car_rental_edits_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_image_displayer.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_main_and_subtext_listing_details.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_shorlet_apartment_details_section.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/app_functions.dart';
import '../../../../../../../utils/constants/images_texts.dart';
import '../../../model/car_rental_model.dart';
import '../widgets/custom_edit_id_name_and_card_displayer.dart';
import '../widgets/custom_listing_details_displayer.dart';
import '../widgets/host_listing_details_view.dart';

class EditHostCarrentalDetails extends StatelessWidget {
  final CarRentalModel carRental;
  const EditHostCarrentalDetails({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final cars = LocalDatabase.moreCarRentalImages;
    return HostListingDetailsView(
      onSearchTap: () {},
      child: CustomColumn(
        children: [
          //Car name
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car name",
            data: "BMW M4. Convertible",
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalNameView(),
            ),
          ),

          //Uploaded Photos
          CustomListingDetailsDisplayer(
            titleName: "Uploaded Photos",
            isJustText: false,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cars.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 0,
                mainAxisExtent: 105,
              ),
              itemBuilder: (_, index) {
                final car = cars[index];
                return CustomImageDisplayer(
                  imageUrl: car,
                  size: 50,
                );
              },
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalImagesView(),
            ),
          ),

          //Listing description
          CustomListingDetailsDisplayer(
            titleName: "Listing description",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Car type",
                  value: "Luxury",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Brand",
                  value: "Ferrari",
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Car year",
                  value: "2024",
                ),
              ],
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalType(),
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
              ],
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalLocation(),
            ),
          ),

          //Car fee
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car fee",
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
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalFee(),
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
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalAvailability(),
            ),
          ),

          //Car details
          CustomListingDetailsDisplayer(
            titleName: "Car details",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Passengers:",
                  value: "3",
                ),
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Seats:",
                  value: "4",
                ),
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Luggages:",
                  value: "2",
                  showDivider: false,
                ),
              ],
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalDetailsView(),
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
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalFeatures(),
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
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalSafetyFeatures(),
            ),
          ),

          //Car policies
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car policies",
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
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalCarPolicies(),
            ),
          ),

          //Car rules
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car rules",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomBullietPointWithText(
                  text: "Additional services offered by the ",
                ),
                CustomBullietPointWithText(
                  text: "Additional services offered by the ",
                ),
                CustomBullietPointWithText(
                  text: "Additional services offered by the ",
                ),
              ],
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalCarRules(),
            ),
          ),

          //Driver’s service
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Driver’s services",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomBullietPointWithText(
                  text:
                      "Cancellation made 24 hours or more before the scheduled pick-up time incur no penalty.",
                ),
              ],
            ),
            onEditTap: () => diplayEditSheet(
              context: context,
              child: const EditCarRentalDriverLicenses(),
            ),
          ),

          //Identification card
          CustomListingDetailsDisplayer(
            titleName: "Identification card",
            isJustText: false,
            child: const CustomColumn(
              children: [CustomEditIdNameAndCardDisplayer()],
            ),
            onEditTap: () {},
          ),
        ],
      ),
    );
  }
}
