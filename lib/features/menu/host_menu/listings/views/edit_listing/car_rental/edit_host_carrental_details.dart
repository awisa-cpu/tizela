import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_bulliet_point_with_text.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/car_rental/widgets/car_rental_edits_imports.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_image_displayer.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_main_and_subtext_listing_details.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_shorlet_apartment_details_section.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/images_texts.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/enums/image_type.dart';
import '../../../model/car_rental_model.dart';
import '../widgets/custom_edit_id_name_and_card_displayer.dart';
import '../widgets/custom_listing_details_displayer.dart';
import '../widgets/host_listing_details_view.dart';

class EditHostCarrentalDetails extends StatelessWidget {
  final CarRentalModel carRental;
  const EditHostCarrentalDetails({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final carFeatures = carRental.carRentalFeatures
        .where((x) => x.isActive.value == true)
        .toList();
    final safetyFeatures = carRental.safetyFeatures
        .where((x) => x.isActive.value == true)
        .toList();
    final carPolicies =
        carRental.carPolicies.where((x) => x.isActive.value == true).toList();
    final driverPolicies = carRental.driverPolicies
        .where((x) => x.isActive.value == true)
        .toList();
    //
    return HostListingDetailsView(
      onSearchTap: () {},
      child: CustomColumn(
        children: [
          //Car name
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car name",
            data: carRental.carName,
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalNameView(
                carRental: carRental,
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
              itemCount: carRental.carImages.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 10.5,
                mainAxisExtent: 105,
              ),
              itemBuilder: (_, index) {
                final carImageUrl = carRental.carImages[index];
                return CustomImageDisplayer(
                  imageUrl: carImageUrl,
                  size: 50,
                  imageType: ImageType.network,
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalImagesView(
                carRental: carRental,
              ),
            ),
          ),

          CustomListingDetailsDisplayer(
            titleName: "Listing description",
            isJustText: false,
            child: CustomColumn(
              children: [
                CustomMainAndSubtextListingDetails(
                  attribute: "Car type",
                  value: carRental.carType,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Brand",
                  value: carRental.carBrand.name,
                ),
                CustomMainAndSubtextListingDetails(
                  attribute: "Car year",
                  value: carRental.carYear,
                ),
              ],
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalType(
                carRental: carRental,
              ),
            ),
          ),

          //todo: location
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
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: const EditCarRentalLocation(),
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
                      availableDates: carRental.availableDates),
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
              child: EditCarRentalAvailability(
                carRental: carRental,
              ),
            ),
          ),

          //Car details
          CustomListingDetailsDisplayer(
            titleName: "Car details",
            isJustText: false,
            child: CustomListview(
              itemCount: carRental.carRentalDetails.length,
              itemBuilder: (_, index) {
                final detail = carRental.carRentalDetails[index];
                return CustomShorletApartmentDetailsSection(
                  detailTitle: "${detail.name}:",
                  value: detail.detailCount.value.toString(),
                );
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalDetailsView(
                carRental: carRental,
              ),
            ),
          ),

          //Features
          CustomListingDetailsDisplayer(
            titleName: "Features",
            isJustText: false,
            child: CustomListview(
              itemCount: carFeatures.length,
              itemBuilder: (_, index) {
                final feature = carFeatures[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
              child: EditCarRentalFeatures(
                carRental: carRental,
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
                final safeFea = safetyFeatures[index];
                return CustomBullietPointWithText(text: safeFea.name);
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalSafetyFeatures(
                carRental: carRental,
              ),
            ),
          ),

          //Car policies
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Car policies",
            isJustText: false,
            child: CustomListview(
              itemCount: carPolicies.length,
              itemBuilder: (_, index) {
                final policy = carPolicies[index];
                return CustomBullietPointWithText(text: policy.name);
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalCarPolicies(
                carRental: carRental,
              ),
            ),
          ),

          //Driver’s service
          CustomListingDetailsDisplayer(
            marginNumber: 13.5,
            titleName: "Driver’s services",
            isJustText: false,
            child: CustomListview(
              itemCount: driverPolicies.length,
              itemBuilder: (_, index) {
                final driverPolicy = driverPolicies[index];
                return CustomBullietPointWithText(text: driverPolicy.name);
              },
            ),
            onEditTap: () => AppFunctions.diplayEditSheet(
              context: context,
              child: EditCarRentalDriverLicenses(
                carRental: carRental,
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
