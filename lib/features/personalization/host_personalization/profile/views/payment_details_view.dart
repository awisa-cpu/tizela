import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../common/widgets/custom_dropdown_form.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../controller/payment_details_controller.dart';
import 'widgets/custom_info_notification_with_text.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentDetailsController = PaymentDetailsController.instance;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          isMainAxisSize: false,
          spacing: 30,
          children: [
            //
            const CustomHeaderSubAndBackButton(
              headerText: "Payment details",
              isthereSubText: false,
            ),

            //
            Form(
              key: paymentDetailsController.accountDetailsFormKey,
              child: CustomColumn(
                children: [
                  //bank name
                  CustomColumn(
                    children: [
                      Text(
                        "Bank name",
                        style: customTextStyle(fontSize: 16),
                      ),
                      const CustomHeight(height: 15),
                      Obx(
                        () => CustomDropdownForm(
                          menuMaxHeight: 200,
                          dropdownColor: AppColors.appWhiteColor,
                          elevation: 3,
                          currentValue:
                              paymentDetailsController.selectedBankName.value,
                          items: paymentDetailsController.allBanks,
                          onChanged: (value) {
                            paymentDetailsController
                                .onBankSelected(value as String);
                          },
                        ),
                      ),
                    ],
                  ),
                  const CustomHeight(height: 30),

                  //account number
                  CustomColumn(
                    children: [
                      Text(
                        "Account number",
                        style: customTextStyle(fontSize: 16),
                      ),
                      const CustomHeight(height: 15),
                      CustomTextFormField(
                        controller: paymentDetailsController.accountNumberCon,
                        labelText: "2212333501",
                        validator: (value) =>
                            AppValidators.validateAccountNumber(value),
                      ),
                      const CustomHeight(height: 7),
                      const CustomInfoNotificationWithText(
                        text: "Please verify your account no.",
                      ),
                    ],
                  ),
                  const CustomHeight(height: 30),

                  //account name
                  CustomColumn(
                    children: [
                      Text(
                        "Account name",
                        style: customTextStyle(fontSize: 16),
                      ),
                      const CustomHeight(height: 15),
                      CustomTextFormField(
                        controller: paymentDetailsController.accountNameCon,
                        labelText: "Asoquo Godwin",
                        validator: (value) => AppValidators.validateTextInput(
                            value: value, fieldName: "Account name"),
                      ),
                      const CustomHeight(height: 7),
                      const CustomInfoNotificationWithText(
                        text: "Please enter the full name on your account",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight() * 0.10,
                  ),
                  CustomEleButton(
                    onPressed: paymentDetailsController.onSaveAccountDetails,
                    text: "save",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
