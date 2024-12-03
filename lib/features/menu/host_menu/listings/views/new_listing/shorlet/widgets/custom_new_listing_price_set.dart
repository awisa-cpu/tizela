import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_host_service_charge.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../../utils/validators/app_validators.dart';
import '../../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../../../controllers/host_shorlet_controller.dart';

class CustomNewListingShorletPriceSet extends StatelessWidget {
  const CustomNewListingShorletPriceSet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

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
              key: controller.apartmentFeeFormKey,
              child: CustomColumn(
                children: [
                  Text(
                    "Set your fee",
                    style: customTextStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextFormField(
                      controller: controller.apartmentPriceCon,
                      hintText: "#0.00",
                      validator: (value) => AppValidators.validatePriceField(
                          value,
                          fieldName: "Apartment price"),
                    ),
                  ),
                  const CustomInfoNotificationWithText(
                    text: "Per night",
                  ),

                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomColumn(
                      children: [
                        Text(
                          "Set caution fee",
                          style: customTextStyle(),
                        ),
                        const CustomHeight(),
                        CustomTextFormField(
                          controller: controller.apartmentCautionFeeCon,
                          hintText: "#0.00",
                          validator: (value) =>
                              AppValidators.validatePriceField(value,
                                  fieldName: "Caution fee"),
                        ),
                        const CustomHeight(),
                        const CustomInfoNotificationWithText(
                          text: "Refundable to customers after checkout",
                        ),
                      ],
                    ),
                  ),

                  //terms and conditions
                  Obx(
                    () => CustomCheckboxWithText(
                      isChecked:
                          controller.isTizelaTermsForPriceAcceptetd.value,
                      isCheckBoxFirst: true,
                      isSpaceBetween: false,
                      activeColor: Colors.green,
                      text: "I accept Tizela service charge of 12.5%",
                      onValueChanged: (newValue) =>
                          AppFunctions.updateCheckboxValue(
                        newValue: newValue,
                        oldValue: controller.isTizelaTermsForPriceAcceptetd,
                      ),
                    ),
                  ),

                  //
                  Obx(
                    () => CustomHostServiceCharge(
                      isTermsAccepted:
                          controller.isTizelaTermsForPriceAcceptetd.value,
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
