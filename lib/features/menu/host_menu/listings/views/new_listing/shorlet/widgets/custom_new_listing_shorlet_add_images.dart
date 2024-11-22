import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_shorlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_image_displayer.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_images_sections.dart';

class CustomNewListingShorletAddImages extends StatelessWidget {
  const CustomNewListingShorletAddImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Add Images",
            subText: "Kindly add clear images to at least four\n categories.",
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
                    itemCount: controller.livingRoomImagesSelected.length,
                    itemBuilder: (_, index) {
                      final image =
                          controller.livingRoomImagesSelected.elementAt(index);

                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                      );
                    },
                    onImageTapSelect: () => controller.addImages(
                      imagesSelected: controller.livingRoomImagesSelected,
                    ),
                  ),
                ),
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Bed",
                    itemCount: controller.bedImagesSelected.length,
                    itemBuilder: (context, index) {
                      final image =
                          controller.bedImagesSelected.elementAt(index);
                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                      );
                    },
                    onImageTapSelect: () => controller.addImages(
                        imagesSelected: controller.bedImagesSelected),
                  ),
                ),
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Bathroom",
                    itemCount: controller.bathroomImagesSelected.length,
                    itemBuilder: (context, index) {
                      final image =
                          controller.bathroomImagesSelected.elementAt(index);
                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                      );
                    },
                    onImageTapSelect: () => controller.addImages(
                        imagesSelected: controller.bathroomImagesSelected),
                  ),
                ),
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Kitchen",
                    itemCount: controller.kitchenImagesSelected.length,
                    itemBuilder: (context, index) {
                      final image =
                          controller.kitchenImagesSelected.elementAt(index);
                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                      );
                    },
                    onImageTapSelect: () => controller.addImages(
                        imagesSelected: controller.kitchenImagesSelected),
                  ),
                ),
                Obx(
                  () => CustomAddImagesSections(
                    headerText: "Amenities",
                    itemCount: controller.amenitiesImagesSelected.length,
                    itemBuilder: (context, index) {
                      final image =
                          controller.amenitiesImagesSelected.elementAt(index);
                      return CustomImageDisplayer(
                        isImageFromFile: true,
                        imageFile: image,
                      );
                    },
                    onImageTapSelect: () => controller.addImages(
                      imagesSelected: controller.amenitiesImagesSelected,
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
