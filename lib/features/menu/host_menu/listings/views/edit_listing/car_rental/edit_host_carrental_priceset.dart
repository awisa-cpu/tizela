import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../common/styles/styles.dart';
import '../../../../../../../common/widgets/widgets.dart';
import '../../../../../../../utils/validators/app_validators.dart';
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../../controllers/edit_host_car_rental_controller.dart';
import '../../../model/car_rental_model.dart';
import '../../new_listing/widgets/custom_host_service_charge.dart';
import '../widgets/edit_host_set_price_view.dart';

class EditHostCarrentalPriceset extends StatelessWidget {
  final CarRentalModel carRental;
  const EditHostCarrentalPriceset({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    return EditHostSetupPrice(
      title: "Set car rental price",
      formWidget: Form(
        key: controller.carRentalPriceKey,
        child: CustomColumn(
          children: [
            CustomTextFormField(
              hintText: "#${carRental.carPrice}",
              controller: controller.carRentalPriceCon,
              validator: (value) => AppValidators.validatePriceField(value,
                  fieldName: "car rental price"),
            ),
            const CustomHeight(),
            const CustomInfoNotificationWithText(text: "for 12 hours"),
            const CustomHeight(height: 15),

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
                          oldValue: controller.isTizelaTandCAccepted)),
            ),

            //
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
                    height: context.screenHeight() * 0.30,
                  ),
            CustomEleButton(
              onPressed: () =>
                  controller.updateCarRentalPrice(carRental: carRental),
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
