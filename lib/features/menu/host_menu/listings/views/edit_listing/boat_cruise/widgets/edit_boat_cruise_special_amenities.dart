import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../widgets/custom_edit_view.dart';

class EditBoatCruiseSpecialAmenities extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseSpecialAmenities({super.key, required this.boatCruise});

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
                "Special Amenities",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomListview(
                itemCount: boatCruise.boatCruiseSpecialtyAmenities.length,
                itemBuilder: (_, index) {
                  final specialAmenity =
                      boatCruise.boatCruiseSpecialtyAmenities[index];
                  return Obx(
                    () => CustomCheckboxWithText(
                      text: specialAmenity.name,
                      isChecked: specialAmenity.isActive.value,
                      onValueChanged: (value) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: value,
                        oldValue: specialAmenity.isActive,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseSpecialAmenity(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatSpecialAmenityUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
