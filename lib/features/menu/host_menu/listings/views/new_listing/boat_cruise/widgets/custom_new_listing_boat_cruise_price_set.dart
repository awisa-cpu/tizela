import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';

import '../../../../../../../../utils/validators/app_validators.dart';
import '../../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../widgets/custom_host_service_charge.dart';

class CustomNewListingBoatCruisePriceSet extends StatelessWidget {
  const CustomNewListingBoatCruisePriceSet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

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
              key: controller.boatPriceKey,
              child: CustomColumn(
                children: [
                  Text(
                    "Set Boat Price",
                    style: customTextStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextFormField(
                      controller: controller.boatPriceController,
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
                        onValueChanged: (newValue) => controller
                            .onTizelaTermsAndConditionsChanged(newValue)),
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
