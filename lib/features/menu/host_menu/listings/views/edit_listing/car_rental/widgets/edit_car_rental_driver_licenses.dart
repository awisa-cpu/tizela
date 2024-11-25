import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditCarRentalDriverLicenses extends StatelessWidget {
  const EditCarRentalDriverLicenses({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomColumn(
            children: [
              Text(
                "Driver's services",
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomCheckboxWithText(
                text: "Lorem ipsum dolar sit",
                isChecked: true,
              ),
              CustomCheckboxWithText(
                text: "Lorem ipsum dolar sit",
                isChecked: false,
              ),
              CustomCheckboxWithText(
                text: "Lorem ipsum dolar sit",
                isChecked: false,
              ),
              CustomCheckboxWithText(
                text: "Lorem ipsum dolar sit",
                isChecked: false,
              ),
              CustomCheckboxWithText(
                text: "Lorem ipsum dolar sit",
                isChecked: false,
              ),
            ],
          ),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}