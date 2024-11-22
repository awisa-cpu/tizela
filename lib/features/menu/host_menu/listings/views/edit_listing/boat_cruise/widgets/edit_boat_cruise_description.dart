import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditBoatCruiseDescription extends StatelessWidget {
  const EditBoatCruiseDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter Boat Description",
            style: customTextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFormField(
              maxLines: 5,
              hintText: "Type here...",
            ),
          ),
          CustomEleButton(
            onPressed: () {},
            text: "Save",
          )
        ],
      ),
    );
  }
}
