import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_car_rental_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';

class CustomNewListingCarDetails extends StatelessWidget {
  const CustomNewListingCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController controller = HostCarRentalController.instance;

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Car details",
            subText: "Kindly share details about the car you want to\n list.",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: controller.carDetails.length,
              itemBuilder: (context, index) {
                final carDetail = controller.carDetails[index];
                return Obx(
                  () {
                    return CustomTextAndAddAndRemoveButtons(
                      text: carDetail.name,
                      count: carDetail.detailCount.value.toString(),
                      onRemove: () =>
                          AppFunctions.decrementCount(carDetail.detailCount),
                      onAdd: () =>
                          AppFunctions.incrementCount(carDetail.detailCount),
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
                Text("Features", style: customTextStyle(fontSize: 16)),
                CustomListview(
                  itemCount: controller.carFeatures.length,
                  itemBuilder: (context, index) {
                    final carFeature = controller.carFeatures[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: carFeature.name,
                          isChecked: carFeature.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: carFeature.isActive,
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
                  itemCount: controller.carRentalSafetyFeatures.length,
                  itemBuilder: (context, index) {
                    final safetyFeature =
                        controller.carRentalSafetyFeatures[index];
                    return Obx(() {
                      return CustomCheckboxWithText(
                        text: safetyFeature.name,
                        isChecked: safetyFeature.isActive.value,
                        onValueChanged: (value) =>
                            AppFunctions.updateCheckboxValue(
                          newValue: value,
                          oldValue: safetyFeature.isActive,
                        ),
                      );
                    });
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
