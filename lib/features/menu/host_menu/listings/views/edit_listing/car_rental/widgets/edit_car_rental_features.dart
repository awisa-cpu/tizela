import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';

class EditCarRentalFeatures extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalFeatures({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Features",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          CustomListview(
            itemCount: carRental.carRentalFeatures.length,
            itemBuilder: (_, index) {
              final feature = carRental.carRentalFeatures[index];
              return Obx(
                () => CustomCheckboxWithText(
                  text: feature.name,
                  isChecked: feature.isActive.value,
                  onValueChanged: (value) => AppFunctions.updateCheckboxValue(
                    newValue: value,
                    oldValue: feature.isActive,
                  ),
                ),
              );
            },
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateCarRentalFeatures(
                currentCarRental: carRental,
              ),
              text: controller.isCarRentalFeaturesUpdating.value
                  ? "updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
