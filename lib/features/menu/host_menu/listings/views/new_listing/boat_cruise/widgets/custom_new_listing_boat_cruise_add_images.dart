import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';
import '../../../edit_listing/widgets/custom_image_displayer.dart';

class CustomNewListingBoatCruiseAddImages extends StatelessWidget {
  const CustomNewListingBoatCruiseAddImages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

    //
    return CustomScrollLayoutWidget(
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
                    itemCount: controller.boatImagesSelected.length,
                    itemBuilder: (_, index) {
                      final image =
                          controller.boatImagesSelected.elementAt(index);

                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                        onDoubleTapDelete: () {
                          controller.boatImagesSelected.remove(image);
                        },
                      );
                    },
                    onImageTapSelect: () => controller.addBoatImages(
                      selectedImages: controller.boatImagesSelected,
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
