import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../../utils/enums/image_type.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';
import '../../widgets/custom_image_displayer.dart';

class EditCarRentalImagesView extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalImagesView({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

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
                    headerText: "Car Images",
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (_, index) {
                      final carImageUrl = controller.selectedImages[index];
                      return CustomImageDisplayer(
                        imageFile: carImageUrl,
                        imageType: ImageType.file,
                        onDoubleTapDelete: () =>
                            AppFunctions.deleteImageFromList(
                          selectedImages: controller.selectedImages,
                          imageFile: carImageUrl,
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
              onPressed: () => controller.updateCarRentalPhotos(
                currentCarRental: carRental,
              ),
              text: controller.isCarRentalPhotosUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
