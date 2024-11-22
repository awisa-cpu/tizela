import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditBoatCruiseLocation extends StatelessWidget {
  const EditBoatCruiseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter Boat location",
            style: customTextStyle(fontSize: 16),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              prefixIcon: Icon(Icons.location_on_outlined),
              hintText: "Enter Address",
            ),
          ),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
