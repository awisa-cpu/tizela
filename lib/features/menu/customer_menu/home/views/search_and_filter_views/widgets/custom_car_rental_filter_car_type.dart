import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';

class CustomCarRentalFilterCarType extends StatelessWidget {
  const CustomCarRentalFilterCarType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Car type",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Sedan",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Suv",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Hatchback",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Convertible",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Luxury",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Coupe",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Minivan",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Pick-up truck",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Van",
          isChecked: false,
        ),
      ],
    );
  }
}
