import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_car_rental_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_host_service_charge.dart';
import 'package:tizela/features/personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import 'package:tizela/utils/validators/app_validators.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';

class CustomNewListingCarRentalPriceSet extends StatelessWidget {
  const CustomNewListingCarRentalPriceSet({super.key});

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController controller = HostCarRentalController.instance;
    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Set your fee",
            subText: "You can change price at anytime",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Form(
              key: controller.carRentalPriceFormKey,
              child: CustomColumn(
                children: [
                  Text(
                    "Set Car Price",
                    style: customTextStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextFormField(
                      controller: controller.carRentalApartmentPriceController,
                      hintText: "#0.00",
                      validator: (value) => AppValidators.validatePriceField(
                          value,
                          fieldName: "Apartment price"),
                    ),
                  ),
                  const CustomInfoNotificationWithText(
                    text: "Per Hour",
                  ),

                  //terms and conditions
                  Obx(
                    () => CustomCheckboxWithText(
                      isChecked: controller.isTizelaTandCAccepted.value,
                      isCheckBoxFirst: true,
                      isSpaceBetween: false,
                      activeColor: Colors.green,
                      text: "I accept Tizela service charge of 12.5%",
                      onValueChanged: (newValue) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: newValue,
                        oldValue: controller.isTizelaTandCAccepted,
                      ),
                    ),
                  ),

                  //
                  Obx(
                    () => CustomHostServiceCharge(
                      isTermsAccepted: controller.isTizelaTandCAccepted.value,
                      earningsAfterServiceCharge:
                          controller.calculateEarningAfterServiceCharge(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
