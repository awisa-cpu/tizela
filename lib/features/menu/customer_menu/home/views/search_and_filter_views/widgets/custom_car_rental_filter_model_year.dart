import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';

class CustomCarRentalFilterModelYear extends StatelessWidget {
  const CustomCarRentalFilterModelYear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Car model year",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "2010-2015",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "2016-2020",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "2021-2024",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "All years available",
          isChecked: true,
        ),
      ],
    );
  }
}
