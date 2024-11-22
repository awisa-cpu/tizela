import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';


class CustomShortletFilterAmenities extends StatelessWidget {
  const CustomShortletFilterAmenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Amenities",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Wifi",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Kitchen",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "4K tv screen",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Gym",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Free Parking space",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Dedicated workspace",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Washer",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Air conditioning",
          isChecked: true,
        ),
      ],
    );
  }
}
