import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/shorlet/widgets/shortlet_edits_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_listing_details_displayer.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_shorlet_apartment_details_section.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_id_name_and_card_displayer.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/enums/image_type.dart';

import '../widgets/custom_image_displayer.dart';
import '../widgets/custom_main_and_subtext_listing_details.dart';
import '../widgets/host_listing_details_view.dart';

class EditHostShorletDetails extends StatelessWidget {
  final ShortletModel shortlet;
  const EditHostShorletDetails({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final safetyFeatures = shortlet.safetyFeatures
        .where(
          (sf) => sf.isActive.value != false,
        )
        .toList();
    final amenities = shortlet.amenities
        .where(
          (am) => am.isActive.value == true,
        )
        .toList();
    final specialAmenities = shortlet.standOutAmenities
        .where(
          (am) => am.isActive.value == true,
        )
        .toList();
    final houseRules = shortlet.houseRules
        .where((rule) => rule.isActive.value == true)
        .toList();

    //
    return HostListingDetailsView(
      onSearchTap: () {},
      child: CustomColumn(
        children: [
          //Apartment name
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Apartment Name",
            data: shortlet.apartmentName,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletNameView(
                shortlet: shortlet,
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
              itemCount: shortlet.apartmentImages.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 7.0,
                crossAxisSpacing: 10.5,
                mainAxisExtent: 90,
              ),
              itemBuilder: (_, index) {
                final shorletImageurl = shortlet.apartmentImages[index];
                return CustomImageDisplayer(
                  imageUrl: shorletImageurl,
                  imageType: ImageType.network,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletUploadedPhotoesView(
                shortlet: shortlet,
              ),
            ),
          ),

          //Apartment Type
          CustomListingDetailsDisplayer(
            titleName: "Apartment Type",
            data: shortlet.apartmentType.name,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletApartmentTypeView(
                shorlet: shortlet,
              ),
            ),
          ),

          //Apartment Story
          CustomListingDetailsDisplayer(
            titleName: "Apartment Story",
            data: shortlet.anyStory,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletApartmentStory(
                shortlet: shortlet,
              ),
            ),
          ),

          CustomListingDetailsDisplayer(
            titleName: "Location",
            isJustText: false,
            child: CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Address",
                  value: shortlet.address.addressWithoutPostal,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Local gov.t",
                  value: shortlet.address.lga,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "State",
                  value: shortlet.address.state,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Postal code",
                  value: shortlet.address.postalCode ?? '',
                ),
                const CustomMainAndSubtextListingDetails(
                  attribute: "Building details",
                  value: '',
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletLocationView(
                shortlet: shortlet,
              ),
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
                      availableDates: shortlet.availableDates),
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
              child: EditShorletAvailability(
                shortlet: shortlet,
              ),
            ),
          ),

          //Check in & Check out
          CustomListingDetailsDisplayer(
            titleName: "Check in & Check out",
            isJustText: false,
            child: Row(
              children: [
                const CustomImageDisplayer(
                  imageUrl: ImagesText.timeCircleIcon,
                  size: 18,
                ),
                const CustomWidth(width: 5),
                Text(
                  // "10:00 AM - 09: 00 AM",
                  "${shortlet.checkInTime} - ${shortlet.checkOutTime}",
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
              child: EditShorletCheckInAndOutTime(
                shortlet: shortlet,
              ),
            ),
          ),

          //Minimum check-in period
          CustomListingDetailsDisplayer(
            titleName: "Minimum check-in period",
            data: shortlet.minimumCheckInTime,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletMinimumCheckinPeriod(
                shortlet: shortlet,
              ),
            ),
          ),

          //Apartment details
          CustomListingDetailsDisplayer(
            titleName: "Apartment details",
            isJustText: false,
            child: CustomListview(
              isPaddingNeeded: false,
              itemCount: shortlet.apartmentDetails.length,
              itemBuilder: (_, index) {
                final apartmentDetail = shortlet.apartmentDetails[index];
                return CustomShorletApartmentDetailsSection(
                  detailTitle: apartmentDetail.name,
                  value: apartmentDetail.detailCount.value.toString(),
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditShorletApartmentDetails(
                shortlet: shortlet,
              ),
            ),
          ),

          //Amenities
          CustomListingDetailsDisplayer(
            titleName: "Amenities",
            isJustText: false,
            child: CustomListview(
              isPaddingNeeded: false,
              itemCount: amenities.length,
              itemBuilder: (_, index) {
                final amenity = amenities[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    amenity.name,
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
              child: EditShorletAmenitiesView(
                shortlet: shortlet,
              ),
            ),
          ),

          //Safety
          CustomListingDetailsDisplayer(
            titleName: "Safety",
            isJustText: false,
            child: CustomListview(
              isPaddingNeeded: false,
              itemCount: safetyFeatures.length,
              itemBuilder: (_, index) {
                final safety = safetyFeatures[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    safety.name,
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
              child: EditShorletSafetyView(
                shortlet: shortlet,
              ),
            ),
          ),

          //Special Amenities
          CustomListingDetailsDisplayer(
            titleName: "Special Amenities",
            isJustText: false,
            child: CustomListview(
              isPaddingNeeded: false,
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
              child: EditShorletStandoutAmenities(
                shortlet: shortlet,
              ),
            ),
          ),

          //House Rules
          CustomListingDetailsDisplayer(
            titleName: "House Rules",
            isJustText: false,
            child: CustomListview(
              isPaddingNeeded: false,
              itemCount: houseRules.length,
              itemBuilder: (_, index) {
                final houseRule = houseRules[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    houseRule.name,
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
              child: EditShorletHouseRulesView(
                shortlet: shortlet,
              ),
            ),
          ),

          //todo: Identification card
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
