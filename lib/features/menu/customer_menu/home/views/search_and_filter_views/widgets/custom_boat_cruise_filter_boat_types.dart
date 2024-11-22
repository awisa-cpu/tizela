import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';

class CustomBoatCruiseFilterBoatTypes extends StatelessWidget {
  const CustomBoatCruiseFilterBoatTypes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Boat type",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Yatch",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Boat",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Jetski",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Kayak",
          isChecked: true,
        ),
      ],
    );
  }
}
