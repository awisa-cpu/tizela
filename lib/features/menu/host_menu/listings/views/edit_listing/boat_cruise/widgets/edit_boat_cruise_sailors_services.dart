import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';

class EditBoatCruiseSailorsServices extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseSailorsServices({super.key, required this.boatCruise});

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
                "Sailor services",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomListview(
                itemCount: boatCruise.boatSailorPolicies.length,
                itemBuilder: (_, index) {
                  final sailorPolicy = boatCruise.boatSailorPolicies[index];
                  return Obx(
                    () => CustomCheckboxWithText(
                      text: sailorPolicy.name,
                      isChecked: sailorPolicy.isActive.value,
                      onValueChanged: (value) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: value,
                        oldValue: sailorPolicy.isActive,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseSailorPolicies(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatSailorPoliciesUpdating.value
                  ? "update in progress"
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
