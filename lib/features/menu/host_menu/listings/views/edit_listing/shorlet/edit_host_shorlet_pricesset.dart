import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_shortlet_controller.dart';
import 'package:tizela/utils/validators/app_validators.dart';
import '../../../../../../../common/widgets/widgets.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../new_listing/widgets/custom_host_service_charge.dart';
import '../widgets/edit_host_set_price_view.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

class EditHostShorletPricesset extends StatelessWidget {
  final ShortletModel shortlet;
  const EditHostShorletPricesset({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return EditHostSetupPrice(
      title: "Set Apartment Price",
      formWidget: Form(
        key: controller.apartmentPriceKey,
        child: CustomColumn(
          children: [
            CustomTextFormField(
              hintText: "#${shortlet.apartmentPrice}",
              controller: controller.apartmentPrice,
              validator: (value) => AppValidators.validatePriceField(
                value,
                fieldName: "apartment price",
              ),
            ),
            const CustomHeight(),
            const CustomInfoNotificationWithText(text: "Per night"),
            CustomColumn(
              children: [
                const CustomHeight(height: 20),
                Text(
                  "Set caution fee",
                  style: customTextStyle(),
                ),
                const CustomHeight(),
                CustomTextFormField(
                  hintText: "#${shortlet.cautionFee}",
                  controller: controller.cautionPriceCon,
                  validator: (value) => AppValidators.validatePriceField(
                    value,
                    fieldName: "apartment price",
                  ),
                ),
                const CustomHeight(),
                const CustomInfoNotificationWithText(
                  text: "Refundable to customers after checkout",
                ),
                const CustomHeight(height: 20),

                //terms and conditions
                Obx(
                  () => CustomCheckboxWithText(
                    isChecked: controller.isTermsAccepted.value,
                    isCheckBoxFirst: true,
                    isSpaceBetween: false,
                    activeColor: Colors.green,
                    text: "I accept Tizela service charge of 12.5%",
                    onValueChanged: (newValue) =>
                        AppFunctions.updateCheckboxValue(
                      newValue: newValue,
                      oldValue: controller.isTermsAccepted,
                    ),
                  ),
                ),

                //
                Obx(
                  () => CustomHostServiceCharge(
                    isTermsAccepted: controller.isTermsAccepted.value,
                    earningsAfterServiceCharge:
                        controller.calculateEarningAfterServiceCharge(),
                  ),
                ),

                CustomEleButton(
                  onPressed: () => controller.updateShorletPrice(shortlet),
                  text: "Save",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
