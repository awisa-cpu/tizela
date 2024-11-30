import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_shorlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/shorlet/widgets/custom_new_listing_shorlet_house_rules.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';
import 'package:get/get.dart';

class CustomNewListingShorletApartmentDetails extends StatelessWidget {
  const CustomNewListingShorletApartmentDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Apartment details",
            subText:
                "Kindly share details about the apartment you\n want to list.",
            onTap: () {},
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: controller.selectedApartmentDetails.length,
              itemBuilder: (_, index) {
                final apartmentDetail =
                    controller.selectedApartmentDetails[index];
                return Obx(() {
                  return CustomTextAndAddAndRemoveButtons(
                    text: apartmentDetail.name,
                    count: apartmentDetail.detailCount.toString(),
                    onAdd: () =>
                        controller.incrementCount(apartmentDetail.detailCount),
                    onRemove: () =>
                        controller.decrementCount(apartmentDetail.detailCount),
                  );
                });
              },
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text(
                  "Amenities",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: controller.selectedAmenities.length,
                  itemBuilder: (_, index) {
                    final amenity = controller.selectedAmenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: amenity.name,
                          isChecked: amenity.isActive.value,
                          onValueChanged: (value) =>
                              controller.onAmenitiySelected(
                            oldValue: amenity.isActive,
                            newValue: value,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: 
            
            CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text(
                  "Safety",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: controller.selectedSafetyFeatures.length,
                  itemBuilder: (_, index) {
                    final safetyFeature =
                        controller.selectedSafetyFeatures[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: safetyFeature.name,
                          isChecked: safetyFeature.isActive.value,
                          onValueChanged: (value) =>
                              controller.onAmenitiySelected(
                            oldValue: safetyFeature.isActive,
                            newValue: value,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: 
            
            CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text(
                  "Standout Amenities",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: controller.selectedStandOutAmenities.length,
                  itemBuilder: (_, index) {
                    final standOutAmenity =
                        controller.selectedStandOutAmenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: standOutAmenity.name,
                          isChecked: standOutAmenity.isActive.value,
                          onValueChanged: (value) =>
                              controller.onAmenitiySelected(
                            oldValue: standOutAmenity.isActive,
                            newValue: value,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          //:
          Padding(
            padding: const EdgeInsets.only(
              top: 13.5,
              bottom: 26,
            ),
            child: 
            
            CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text(
                  "House rules",
                  style: customTextStyle(),
                ),
                const CustomHeight(),
                CustomListview(
                  itemCount: controller.apartHouseRules.length,
                  itemBuilder: (_, index) {
                    final houseRule = controller.apartHouseRules[index];

                    return Obx(
                      () => CustomNewListingShorletHouseRules(
                        headerText: "${houseRule.name}?",
                        firstText: "${houseRule.yesText}.",
                        secondText: "${houseRule.noText}.",
                        isFirstValueChecked: houseRule.isFirstValue.value,
                        isSecondValueChecked: houseRule.isSecondValue.value,
                        onFirstValueChanged: (_) => controller
                            .onFirstHouseRuleChanged(houseRule: houseRule),
                        onSecondValueChanged: (_) => controller
                            .onSecondHouseRuleChanged(houseRule: houseRule),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
