import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

class EditCarRentalImagesView extends StatelessWidget {
  const EditCarRentalImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          //
          Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: CustomColumn(
              children: [
                CustomAddImagesSections(
                  headerText: "Car Images",
                  onImageTapSelect: () {},
                    itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
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
