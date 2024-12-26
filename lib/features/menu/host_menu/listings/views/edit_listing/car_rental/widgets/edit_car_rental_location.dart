import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_car_rental_controller.dart';

import '../../../../../../../../common/widgets/custom_dropdown_form.dart';
import '../../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../model/car_rental_model.dart';
import '../../widgets/custom_edit_view.dart';

class EditCarRentalLocation extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalLocation({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    ///
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter Car location",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomColumn(
              children: [
                CustomTextFormField(
                  controller: controller.addressStreetNameCon,
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  hintText: carRental.address.streetName,
                ),
                const CustomHeight(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.addressHouseNumberCon,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        hintText: carRental.address.houseNumber,
                      ),
                    ),
                    const CustomWidth(),
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.addressPostalCodeCon,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        hintText: carRental.address.postalCode,
                      ),
                    ),
                  ],
                ),
                const CustomHeight(),
                //state
                Obx(
                  () => CustomDropdownForm(
                    currentValue: controller.currentStateValue.value,
                    items: NigerianStatesAndLGA.allStates,
                    onChanged: (newState) =>
                        AppFunctions.updateCheckboxStringValue(
                      newValue: newState as String,
                      oldValue: controller.currentStateValue,
                    ),
                  ),
                ),
                //lga
                const CustomHeight(),
                Obx(
                  () => CustomDropdownForm(
                    currentValue: controller.currentStateLga.value,
                    items: NigerianStatesAndLGA.getStateLGAs(
                      controller.currentStateValue.value != "Select a state"
                          ? controller.currentStateValue.value
                          : "FCT(Abuja)",
                    ),
                    onChanged: (newState) =>
                        AppFunctions.updateCheckboxStringValue(
                      newValue: newState as String,
                      oldValue: controller.currentStateLga,
                    ),
                  ),
                )
              ],
            ),
          ),

          //
          Text(
            "Car movement areas",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(),
          Text(
            "Please select the areas where you would like\n your car to be able to go.",
            style: customTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.appTextFadedColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => CustomCheckboxWithText(
                    text: "Only Location State",
                    isChecked: controller.isIntraStateMovement.value,
                    isCheckBoxFirst: true,
                    onValueChanged: (_) =>
                        AppFunctions.onCarLocationIntraStateMovement(
                      isIntraStateMovement: controller.isIntraStateMovement,
                      isInterStateMovement: controller.isInterStateMovement,
                      isCarMovementOutsideState:
                          controller.isCarMovementOutsideState,
                    ),
                  ),
                ),
                Obx(
                  () => CustomCheckboxWithText(
                    text: "Inter-State",
                    isChecked: controller.isInterStateMovement.value,
                    isCheckBoxFirst: true,
                    onValueChanged: (_) =>
                        AppFunctions.onCarLocationInterStateMovement(
                      isIntraStateMovement: controller.isIntraStateMovement,
                      isInterStateMovement: controller.isInterStateMovement,
                      isCarMovementOutsideState:
                          controller.isCarMovementOutsideState,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateCarRentalAddress(
                currentCarRental: carRental,
              ),
              text: controller.isCarRentalAddressUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
