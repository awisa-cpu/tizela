import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';


class CustomShorletFilterStandoutAmenities extends StatelessWidget {
  const CustomShorletFilterStandoutAmenities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "Standout Amenities",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Pool",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Beach access",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Lake access",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Hot tub",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "BBQ grill",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Outdoor dining area",
          isChecked: false,
        ),
      ],
    );
  }
}
