import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';

class EditBoatCruisePolicies extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruisePolicies({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomColumn(
            children: [
              Text(
                "Boat policies",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomListview(
                itemCount: boatCruise.boatPolicies.length,
                itemBuilder: (_, index) {
                  final boatPolicy = boatCruise.boatPolicies[index];
                  return Obx(
                    () => CustomCheckboxWithText(
                      text: boatPolicy.name,
                      isChecked: boatPolicy.isActive.value,
                      onValueChanged: (value) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: value,
                        oldValue: boatPolicy.isActive,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseBoatPolicies(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatPoliciesUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
