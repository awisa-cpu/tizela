import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/host_boat_cruise_controller.dart';

class CustomNewListingBoatDetails extends StatelessWidget {
  const CustomNewListingBoatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Boat details",
            subText: "Kindly share details about the boat you\n want to list.",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: controller.boatDetails.length,
              itemBuilder: (context, index) {
                final boatDetail = controller.boatDetails[index];
                return Obx(
                  () {
                    return CustomTextAndAddAndRemoveButtons(
                      text: boatDetail.name,
                      count: boatDetail.detailCount.value.toString(),
                      onRemove: () =>
                          AppFunctions.decrementCount(boatDetail.detailCount),
                      onAdd: () =>
                          AppFunctions.incrementCount(boatDetail.detailCount),
                    );
                  },
                );
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
                Text("Amenities", style: customTextStyle(fontSize: 16)),
                CustomListview(
                  itemCount: controller.boatAmenities.length,
                  itemBuilder: (context, index) {
                    final boatAmenity = controller.boatAmenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: boatAmenity.name,
                          isChecked: boatAmenity.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: boatAmenity.isActive,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text("Safety Features", style: customTextStyle(fontSize: 16)),
                CustomListview(
                  itemCount: controller.boatSafety.length,
                  itemBuilder: (context, index) {
                    final boatSafety = controller.boatSafety[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: boatSafety.name,
                          isChecked: boatSafety.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: boatSafety.isActive,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                Text("Special Amenities", style: customTextStyle(fontSize: 16)),
                CustomListview(
                  itemCount: controller.boatSpecialtyAmenities.length,
                  itemBuilder: (context, index) {
                    final boatSpecialtyAmenity =
                        controller.boatSpecialtyAmenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: boatSpecialtyAmenity.name,
                          isChecked: boatSpecialtyAmenity.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: boatSpecialtyAmenity.isActive,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
