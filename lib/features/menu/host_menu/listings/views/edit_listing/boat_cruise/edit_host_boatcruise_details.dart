import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/boat_cruise/widgets/boat_cruise_edits_imports.dart';
import '../../../../../../../common/styles/styles.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/images_texts.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/enums/image_type.dart';
import '../widgets/custom_image_displayer.dart';
import '../widgets/custom_listing_details_displayer.dart';
import '../widgets/custom_main_and_subtext_listing_details.dart';
import '../widgets/custom_shorlet_apartment_details_section.dart';
import '../widgets/host_listing_details_view.dart';
import 'widgets/edit_boat_cruise_special_amenities.dart';

class EditHostBoatcruiseDetails extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditHostBoatcruiseDetails({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final featuresAmenities = boatCruise.boatAmenities
        .where((x) => x.isActive.value == true)
        .toList();
    final safetyFeatures = boatCruise.boatSafetyFeatures
        .where((x) => x.isActive.value == true)
        .toList();
    final specialAmenities = boatCruise.boatCruiseSpecialtyAmenities
        .where((x) => x.isActive.value == true)
        .toList();
    final boatPolicies =
        boatCruise.boatPolicies.where((x) => x.isActive.value == true).toList();
    final sailorPolicies = boatCruise.boatSailorPolicies
        .where((x) => x.isActive.value == true)
        .toList();

    //

    return HostListingDetailsView(
      onSearchTap: () {},
      child: CustomColumn(
        children: [
          //Boat name
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Boat name",
            data: boatCruise.name,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseNameView(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Uploaded Photos
          CustomListingDetailsDisplayer(
            titleName: "Uploaded Photos",
            isJustText: false,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: boatCruise.boatImages.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 90,
              ),
              itemBuilder: (_, index) {
                final boatImageUrl = boatCruise.boatImages[index];
                return CustomImageDisplayer(
                  imageUrl: boatImageUrl,
                  size: 80,
                  imageType: ImageType.network,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseImagesView(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //boat type and description
          CustomListingDetailsDisplayer(
            titleName: "Listing description",
            isJustText: false,
            child: CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Boat type",
                  value: boatCruise.boatType.boatName,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Boat description",
                  value: boatCruise.boatStory ?? '',
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseDescription(
                boatCruise: boatCruise,
              ),
            ),
          ),


          //location
          CustomListingDetailsDisplayer(
            titleName: "Location",
            isJustText: false,
            child:  CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Address",
                  value: boatCruise.address.addressWithoutPostal ,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Local gov.t",
                  value: boatCruise.address.lga,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "State",
                  value: boatCruise.address.state,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Postal code",
                  value: boatCruise.address.postalCode??'',
                ),
               const  CustomMainAndSubtextListingDetails(
                  attribute: "Building details",
                  value: "",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseLocation(boatCruise: boatCruise,),
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
                  AppFunctions.getDateRange(
                    availableDates: boatCruise.availableDates,
                  ),
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
              child: EditBoatCruiseAvailability(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //boat details
          CustomListingDetailsDisplayer(
            titleName: "Boat details",
            isJustText: false,
            child: CustomListview(
              itemCount: boatCruise.boatCruiseDetails.length,
              itemBuilder: (_, index) {
                final details = boatCruise.boatCruiseDetails[index];
                return CustomShorletApartmentDetailsSection(
                  detailTitle: details.name,
                  value: details.detailCount.value.toString(),
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseDetailsView(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Features
          CustomListingDetailsDisplayer(
            titleName: "Features",
            isJustText: false,
            child: CustomListview(
              itemCount: featuresAmenities.length,
              itemBuilder: (_, index) {
                final feature = featuresAmenities[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    feature.name,
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseFeatures(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Special amenities
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Special Amenities",
            isJustText: false,
            child: CustomListview(
              itemCount: specialAmenities.length,
              itemBuilder: (_, index) {
                final specialAmenity = specialAmenities[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    specialAmenity.name,
                    style: customTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseSpecialAmenities(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Safety features
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Safety features",
            isJustText: false,
            child: CustomListview(
              itemCount: safetyFeatures.length,
              itemBuilder: (_, index) {
                final safetyFeature = safetyFeatures[index];
                return CustomBullietPointWithText(
                  text: safetyFeature.name,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseSafetyFeatures(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Boat policies
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Boat policies",
            isJustText: false,
            child: CustomListview(
              itemCount: boatPolicies.length,
              itemBuilder: (_, index) {
                final boatPolicy = boatPolicies[index];
                return CustomBullietPointWithText(
                  text: boatPolicy.name,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruisePolicies(
                boatCruise: boatCruise,
              ),
            ),
          ),

          //Sailors service
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Sailor services",
            isJustText: false,
            child: CustomListview(
              itemCount: sailorPolicies.length,
              itemBuilder: (_, index) {
                final sailorPolicy = sailorPolicies[index];
                return CustomBullietPointWithText(
                  text: sailorPolicy.name,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditBoatCruiseSailorsServices(
                boatCruise: boatCruise,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
