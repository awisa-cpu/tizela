import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

class EditShorletApartmentDetails extends StatelessWidget {
  const EditShorletApartmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Apartment details",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                CustomTextAndAddAndRemoveButtons(
                  text: "Guests",
                  style: customTextStyle(fontWeight: FontWeight.w500),
                  onRemove: () {},
                  onAdd: () {},
                ),
                CustomTextAndAddAndRemoveButtons(
                  text: "Bedrooms",
                  style: customTextStyle(fontWeight: FontWeight.w500),
                  onRemove: () {},
                  onAdd: () {},
                ),
                CustomTextAndAddAndRemoveButtons(
                  text: "Bed",
                  style: customTextStyle(fontWeight: FontWeight.w500),
                  onRemove: () {},
                  onAdd: () {},
                ),
                CustomTextAndAddAndRemoveButtons(
                  text: "Bathrooms",
                  style: customTextStyle(fontWeight: FontWeight.w500),
                  onRemove: () {},
                  onAdd: () {},
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
