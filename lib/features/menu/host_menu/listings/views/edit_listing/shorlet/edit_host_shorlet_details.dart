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
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

import '../widgets/custom_image_displayer.dart';
import '../widgets/custom_main_and_subtext_listing_details.dart';
import '../widgets/host_listing_details_view.dart';

class EditHostShorletDetails extends StatelessWidget {
  final ShortletModel shortlet;
  const EditHostShorletDetails({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
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
              child: const EditShorletLocationView(),
            ),
          ),

          //apartment fee
          CustomListingDetailsDisplayer(
            titleName: "Apartment fee",
            isJustText: false,
            child: CustomColumn(
              children: [
                Text(
                  "Set Apartment Price",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const CustomHeight(),
                const CustomTextFormField(
                  hintText: "#64,000",
                ),
                const CustomInfoNotificationWithText(
                  text: "per night",
                ),
                const CustomHeight(height: 25),
                Text(
                  "Set Caution fee",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const CustomHeight(),
                const CustomTextFormField(
                  hintText: "#50,000",
                ),
                const CustomInfoNotificationWithText(
                  text: "Refundable to customers after check-out",
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditShorletApartmentPrice(),
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
              child: const EditShorletAvailability(),
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
                  "10:00 AM - 09: 00 AM",
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
              child: const EditShorletCheckInAndOutTime(),
            ),
          ),

          //Minimum check-in period
          CustomListingDetailsDisplayer(
            titleName: "Minimum check-in period",
            data: "1 night",
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditShorletMinimumCheckinPeriod(),
            ),
          ),

          //Apartment details
          CustomListingDetailsDisplayer(
            titleName: "Apartment details",
            isJustText: false,
            child: const CustomColumn(
              children: [
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Guests:",
                  value: "4",
                ),
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Bedrooms:",
                  value: "2",
                ),
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Bed:",
                  value: "2",
                ),
                CustomShorletApartmentDetailsSection(
                  detailTitle: "Bathrooms:",
                  value: "2",
                  showDivider: false,
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditShorletApartmentDetails(),
            ),
          ),

          //Amenities
          CustomListingDetailsDisplayer(
            titleName: "Amenities",
            isJustText: false,
            child: CustomColumn(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Wifi",
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
                    "Kitchen",
                    style: customTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "4k tv screen",
                    style: customTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Gym",
                    style: customTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Free Parking space",
                    style: customTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                    ),
                  ),
                )
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditShorletAmenitiesView(),
            ),
          ),

          //Safety
          CustomListingDetailsDisplayer(
            titleName: "Safety",
            isJustText: false,
            child: CustomColumn(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "First Aid",
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
                    "Fire extinguisher",
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
              child: const EditShorletSafetyView(),
            ),
          ),

          //Special Amenities
          CustomListingDetailsDisplayer(
            titleName: "Special Amenities",
            isJustText: false,
            child: CustomColumn(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "Pool",
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
                    "Beach access",
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
                    "Lake access",
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
                    "Hot tub",
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
              child: const EditShorletStandoutAmenities(),
            ),
          ),

          //House Rules
          CustomListingDetailsDisplayer(
            titleName: "House Rules",
            isJustText: false,
            child: CustomColumn(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "No pets allowed",
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
                    "No smoking allowed",
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
                    "Yes, party is allowed",
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
              child: const EditShorletHouseRulesView(),
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
