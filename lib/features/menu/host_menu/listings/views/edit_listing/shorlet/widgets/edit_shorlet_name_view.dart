import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditShorletNameView extends StatelessWidget {
  const EditShorletNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter apartment name",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(height: 15),
          const CustomTextFormField(
            hintText: "Apartment name",
          ),
          const CustomHeight(height: 20),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
