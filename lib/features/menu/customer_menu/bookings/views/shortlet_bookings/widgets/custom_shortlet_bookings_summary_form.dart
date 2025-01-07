import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../common/styles/custom_text_style.dart';

class CustomShortletBookingsSummaryForm extends StatelessWidget {
  const CustomShortletBookingsSummaryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  CustomCheckboxWithText(
                    text: "Myself",
                    isChecked: true,
                    isSpaceBetween: false,
                  ),
                  const CustomWidth(width: 10),
                  CustomCheckboxWithText(
                    text: "Someone else",
                    isChecked: true,
                    isSpaceBetween: false,
                  ),
                ],
              ),
            ],
          ),
          Form(
            child: CustomColumn(
              spacing: 15,
              children: [
                const CustomTextFormField(hintText: "First name"),
                const CustomTextFormField(hintText: "Last name"),
                const CustomTextFormField(hintText: "Email Address"),
                const Row(
                  children: [
                    Expanded(child: CustomTextFormField()),
                    CustomWidth(width: 15),
                    Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          hintText: "Phone number",
                        )),
                  ],
                ),
                const CustomHeight(height: 20),
                CustomEleButton(
                  // onPressed: () => AppNagivator.pushRoute(
                  //   const SuccessView(
                  //       mainText: "Booking successful",
                  //       subText:
                  //           "Thank you for your bookings, we will get back to you as soon as possible"),
                  // ),
                  onPressed: () {},
                  text: "Pay",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
