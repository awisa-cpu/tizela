import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../utils/constants/app_colors.dart';
import '../../widgets/custom_edit_view.dart';

class EditCarRentalLocation extends StatefulWidget {
  const EditCarRentalLocation({super.key});

  @override
  State<EditCarRentalLocation> createState() => _EditCarRentalLocationState();
}

class _EditCarRentalLocationState extends State<EditCarRentalLocation> {
  bool onlyState = false, interState = false;
  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter Car location",
            style: customTextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              prefixIcon: Icon(Icons.location_on_outlined),
              hintText: "Enter address",
            ),
          ),
          Text(
            "Car movement areas",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(),
          Text(
            "Please select the areas where you would like\n your car to be able to go.",
            style: customTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.appTextFadedColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCheckboxWithText(
                  text: "Only Location State",
                  isChecked: onlyState,
                  isCheckBoxFirst: true,
                  onValueChanged: (_) {
                    onlyState = true;
                    interState = false;
                    setState(() {});
                  },
                ),
                CustomCheckboxWithText(
                  text: "Inter-State",
                  isChecked: interState,
                  isCheckBoxFirst: true,
                  onValueChanged: (_) {
                    onlyState = false;
                    interState = true;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
