import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';


class CustomShorletFilterHouseRules extends StatelessWidget {
  const CustomShorletFilterHouseRules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "House rules",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Pet allowed",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Smoking allowed",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Partying allowed",
          isChecked: true,
        )
      ],
    );
  }
}
