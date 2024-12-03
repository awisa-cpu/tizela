import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';

class EditCarRentalCarPolicies extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalCarPolicies({super.key, required this.carRental});

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
                "Car policies",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomListview(
                itemCount: carRental.carPolicies.length,
                itemBuilder: (_, index) {
                  final carPolicy = carRental.carPolicies[index];
                  return Obx(
                    () => CustomCheckboxWithText(
                      text: carPolicy.name,
                      isChecked: carPolicy.isActive.value,
                      onValueChanged: (value) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: value,
                        oldValue: carPolicy.isActive,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          CustomEleButton(
            onPressed: () => controller.updateCarRentalPolicy(
              currentCarRental: carRental,
            ),
            text: controller.isCarRentalPoliciesUpdating.value
                ? "updating in progress..."
                : "Save",
          )
        ],
      ),
    );
  }
}
