import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

class EditShorletUploadedPhotoesView extends StatelessWidget {
  const EditShorletUploadedPhotoesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          //
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: CustomColumn(
              children: [
                CustomAddImagesSections(
                  headerText: "Living room",
                  onImageTapSelect: () {},
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
                  },
                ),
                CustomAddImagesSections(
                  headerText: "Bed",
                  onImageTapSelect: () {},
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
                  },
                ),
                CustomAddImagesSections(
                  headerText: "Bathroom",
                  onImageTapSelect: () {},
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
                  },
                ),
                CustomAddImagesSections(
                  headerText: "Kitchen",
                  onImageTapSelect: () {},
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
                  },
                ),
                CustomAddImagesSections(
                  headerText: "Amenities",
                  onImageTapSelect: () {},
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const Text("");
                  },
                ),
              ],
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
