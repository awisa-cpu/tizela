import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';


class CustomShorletFilterSafetycheckboxes extends StatelessWidget {
  const CustomShorletFilterSafetycheckboxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Safety",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Smoke alarm",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "First aid",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Fire extinguisher",
          isChecked: true,
        )
      ],
    );
  }
}
