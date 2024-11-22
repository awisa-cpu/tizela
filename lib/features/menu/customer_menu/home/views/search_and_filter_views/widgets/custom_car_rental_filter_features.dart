import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';

class CustomCarRentalFilterFeatures extends StatelessWidget {
  const CustomCarRentalFilterFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    
    CustomColumn(
      children: [
        Text(
          "Features",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
        CustomCheckboxWithText(
          text: "Air Conditioning",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Bluetooth Connectivity",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Navigation System",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Sunroof/Moonroof",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Leather Seats",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Backup Camera",
          isChecked: true,
        ),
        CustomCheckboxWithText(
          text: "Heated seats",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Keyless entry",
          isChecked: false,
        ),
        CustomCheckboxWithText(
          text: "Apple CarPlay/Android Auto",
          isChecked: false,
        ),
      ],
    );
  }
}
