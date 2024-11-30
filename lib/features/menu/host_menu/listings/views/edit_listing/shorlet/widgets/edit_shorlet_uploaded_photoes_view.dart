import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../../utils/enums/image_type.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';
import '../../widgets/custom_image_displayer.dart';

class EditShorletUploadedPhotoesView extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletUploadedPhotoesView({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          //
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: CustomColumn(
              children: [
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Uploaded photos",
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (context, index) {
                      final imageFile = controller.selectedImages[index];
                      return CustomImageDisplayer(
                        imageFile: imageFile,
                        imageType: ImageType.file,
                        onDoubleTapDelete: () =>
                            AppFunctions.deleteImageFromList(
                          selectedImages: controller.selectedImages,
                          imageFile: imageFile,
                        ),
                      );
                    },
                    onImageTapSelect: () => AppFunctions.selectImages(
                      selectedImages: controller.selectedImages,
                    ),
                  ),
                ),
                /*
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

                */
              ],
            ),
          ),

          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateShortletImages(shortlet: shortlet),
              text: controller.areImagesUpdating.value
                  ? "Update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
