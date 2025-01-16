import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../../common/styles/custom_text_style.dart';
import '../../../controller/shortlet_booking_summary_controller.dart';

class CustomShortletBookingsSummaryForm extends StatelessWidget {
  const CustomShortletBookingsSummaryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ShortletBookingSummaryController.instance;

    //
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomColumn(
        children: [
          //first section
          CustomColumn(
            children: [
              Text(
                "Who is checking in?",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              const CustomHeight(height: 15),
              Obx(
                () => Row(
                  spacing: 10,
                  children: [
                    CustomCheckboxWithText(
                      text: "Myself",
                      isChecked: controller.isSamePersonCheckIn.value,
                      isSpaceBetween: false,
                      onValueChanged: (_) =>
                          controller.updateSamePersonCheckBoxValue(),
                    ),
                    CustomCheckboxWithText(
                      text: "Someone else",
                      isChecked: controller.isSomeoneElseCheckIn.value,
                      isSpaceBetween: false,
                      onValueChanged: (_) =>
                          controller.updateSomeoneElseCheckBoxValue(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //second section
          Obx(
            () => Form(
              key: controller.shortletBookingFormKey,
              child: CustomColumn(
                spacing: 15,
                children: [
                  CustomTextFormField(
                    hintText: "First name",
                    controller: TextEditingController(
                      text: controller.firstName.value,
                    ),
                    onChanged: (value) => controller.firstName.value = value,
                  ),
                  CustomTextFormField(
                    hintText: "Last name",
                    controller: TextEditingController(
                      text: controller.lastName.value,
                    ),
                    onChanged: (value) => controller.lastName.value = value,
                  ),
                  CustomTextFormField(
                    hintText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(
                      text: controller.emailAddress.value,
                    ),
                    onChanged: (value) => controller.emailAddress.value = value,
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      const Expanded(child: CustomTextFormField()),
                      Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          hintText: "Phone number",
                          controller: TextEditingController(
                            text: controller.phoneNumber.value,
                          ),
                          onChanged: (value) =>
                              controller.phoneNumber.value = value,
                        ),
                      ),
                    ],
                  ),
                  const CustomHeight(height: 20),
                  CustomEleButton(
                    // onPressed: controller.makePayment,
                    onPressed: (){},
                    text: "Pay",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
