import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../../utils/enums/image_type.dart';
import '../../../../controllers/host_car_rental_controller.dart';
import '../../../edit_listing/widgets/custom_image_displayer.dart';

class CustomNewListingCarRentalAddImages extends StatelessWidget {
  const CustomNewListingCarRentalAddImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController controller = HostCarRentalController.instance;

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Add Images",
            subText:
                "Kindly add clear images of the car you are about \nto least (minimum of 5 images).",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: CustomColumn(
              children: [
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Living room",
                    itemCount: controller.carImagesSelected.length,
                    itemBuilder: (_, index) {
                      final image = controller.carImagesSelected[index];

                      return CustomImageDisplayer(
                        imageType: ImageType.file,
                        imageFile: image,
                        onDoubleTapDelete: () =>
                            AppFunctions.deleteImageFromList(
                          selectedImages: controller.carImagesSelected,
                          imageFile: image,
                        ),
                      );
                    },
                    onImageTapSelect: () => AppFunctions.selectImages(
                      selectedImages: controller.carImagesSelected,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
