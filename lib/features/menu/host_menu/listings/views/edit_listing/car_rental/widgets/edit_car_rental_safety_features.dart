import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';

class EditCarRentalSafetyFeatures extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalSafetyFeatures({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomColumn(
            children: [
              Text(
                "Safety Features",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomListview(
                itemCount: carRental.safetyFeatures.length,
                itemBuilder: (_, index) {
                  final safetyFeature = carRental.safetyFeatures[index];
                  return Obx(
                    () => CustomCheckboxWithText(
                      text: safetyFeature.name,
                      isChecked: safetyFeature.isActive.value,
                      onValueChanged: (value) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: value,
                        oldValue: safetyFeature.isActive,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateCarRentalSafetyFeatures(
                currentCarRental: carRental,
              ),
              text: controller.isCarRentalSafetyFeaturesUpdating.value
                  ? "updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
