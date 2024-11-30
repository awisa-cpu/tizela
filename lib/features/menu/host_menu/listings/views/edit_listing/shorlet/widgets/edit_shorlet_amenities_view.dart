import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';

class EditShorletAmenitiesView extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletAmenitiesView({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomColumn(
              children: [
                Text(
                  "Amenities",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: shortlet.amenities.length,
                  itemBuilder: (_, index) {
                    final amenity = shortlet.amenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: amenity.name,
                          isChecked: amenity.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                                  newValue: value, oldValue: amenity.isActive),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateShortletAmenities(shortlet: shortlet),
              text: controller.isShorletAmenitiesUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
