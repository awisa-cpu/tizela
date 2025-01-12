import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';

class EditBoatCruiseLocation extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseLocation({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter Boat location",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomColumn(
              children: [
                CustomTextFormField(
                  controller: controller.addressStreetNameCon,
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  hintText: boatCruise.address.streetName,
                ),
                const CustomHeight(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.addressHouseNumberCon,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        hintText: boatCruise.address.houseNumber,
                      ),
                    ),
                    const CustomWidth(),
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.addressPostalCodeCon,
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        hintText: boatCruise.address.postalCode,
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
          const CustomHeight(height: 20),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateBoatCruiseAddress(boatCruise: boatCruise),
              text: controller.isBoatAddressUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
