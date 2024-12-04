import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_image_displayer.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';
import 'package:tizela/utils/enums/image_type.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';

class EditBoatCruiseImagesView extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseImagesView({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          //
          Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: CustomColumn(
              children: [
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Boat images",
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (_, index) {
                      final imageFile = controller.selectedImages[index];
                      return CustomImageDisplayer(
                        imageFile: imageFile,
                        imageType: ImageType.file,
                        onDoubleTapDelete: () =>
                            AppFunctions.deleteImageFromList(
                          imageFile: imageFile,
                          selectedImages: controller.selectedImages,
                        ),
                      );
                    },
                    onImageTapSelect: () => AppFunctions.selectImages(
                      selectedImages: controller.selectedImages,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseImages(
                  currentBoatCruise: boatCruise),
              text: controller.isBoatImagesUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
