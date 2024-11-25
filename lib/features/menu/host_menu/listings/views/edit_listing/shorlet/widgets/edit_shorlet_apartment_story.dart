import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_shortlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../model/shorlet_model.dart';

class EditShorletApartmentStory extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletApartmentStory({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Tell a story about the apartment host, or\n neighborhood",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFormField(
              maxLines: 5,
              hintText: "Type here...",
              controller: controller.shorletAnyStoryCon,
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateShortletStory(shortlet: shortlet),
              text: controller.isShorletStoryUpdating.value
                  ? "Updating in progress"
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
