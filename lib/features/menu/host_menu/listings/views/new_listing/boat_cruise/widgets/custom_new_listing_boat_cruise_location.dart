import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../../common/styles/custom_height.dart';
import '../../../../../../../../common/styles/custom_scrollable_layout_widget.dart';
import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../../../../../../common/styles/custom_width.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../../utils/validators/app_validators.dart';

class CustomNewListingBoatCruiseLocation extends StatelessWidget {
  const CustomNewListingBoatCruiseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;
    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Location",
            subText:
                "Your address is only shared with guests after \nthey've made a reservation.",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Form(
              key: controller.boatAddressKey,
              child: CustomColumn(
                children: [
                  CustomTextFormField(
                    controller: controller.addressStreetNameCon,
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    hintText: "Street name",
                    validator: (address) => AppValidators.validateTextField(
                        address,
                        fieldName: "Street name"),
                  ),
                  const CustomHeight(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: controller.addressHouseNumberCon,
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          hintText: "House Number",
                          validator: (address) =>
                              AppValidators.validateTextField(address,
                                  fieldName: "House number"),
                        ),
                      ),
                      const CustomWidth(),
                      Expanded(
                        child: CustomTextFormField(
                          controller: controller.addressPostalCodeCon,
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          hintText: "Postal code",
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
          ),
          Row(
            children: [
              const Icon(
                Icons.my_location_outlined,
                size: 15,
              ),
              const CustomWidth(width: 7),
              Text(
                "Use current location",
                style: customTextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          CustomHeight(
            height: context.screenHeight() * 0.50,
          ),
        ],
      ),
    );
  }
}
