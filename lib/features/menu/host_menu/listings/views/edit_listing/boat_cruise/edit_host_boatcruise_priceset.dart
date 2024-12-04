import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../common/styles/styles.dart';
import '../../../../../../../common/widgets/widgets.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/validators/app_validators.dart';
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../model/boat_cruise_model.dart';
import '../../new_listing/widgets/custom_host_service_charge.dart';
import '../widgets/edit_host_set_price_view.dart';

class EditHostBoatcruisePriceset extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditHostBoatcruisePriceset({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return EditHostSetupPrice(
      title: "Set boat cruise price",
      formWidget: Form(
        key: controller.editBoatKey,
        child: CustomColumn(
          children: [
            CustomTextFormField(
              hintText: "#${boatCruise.boatFee}",
              controller: controller.editBoatFeeController,
              validator: (value) =>
                  AppValidators.validateTextField(value, fieldName: "Boat fee"),
            ),
            const CustomHeight(),
            const CustomInfoNotificationWithText(text: "for 12 hours"),
            const CustomHeight(height: 15),
            Obx(
              () => CustomCheckboxWithText(
                isChecked: controller.isTizelaTandCAccepted.value,
                isCheckBoxFirst: true,
                isSpaceBetween: false,
                activeColor: Colors.green,
                text: "I accept Tizela service charge of 12.5%",
                onValueChanged: (value) => AppFunctions.updateCheckboxValue(
                  newValue: value,
                  oldValue: controller.isTizelaTandCAccepted,
                ),
              ),
            ),
            Obx(
              () => CustomHostServiceCharge(
                isTermsAccepted: controller.isTizelaTandCAccepted.value,
                earningsAfterServiceCharge:
                    controller.calculateEarningAfterServiceCharge(),
              ),
            ),
            controller.isTizelaTandCAccepted.value
            
                ? const CustomHeight()
                : CustomHeight(
                    height: context.screenHeight() * 0.35,
                  ),
            CustomEleButton(
              onPressed: () => controller.updateBoatCruisePrice(
                  currentBoatCruise: boatCruise),
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
