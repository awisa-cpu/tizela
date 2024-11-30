import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';

import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';

class EditShorletStandoutAmenities extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletStandoutAmenities({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;
    return CustomEditView(
      child: CustomColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomColumn(
              children: [
                Text(
                  "Standout Amenities",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: shortlet.standOutAmenities.length,
                  itemBuilder: (_, index) {
                    final standOutAmenity = shortlet.standOutAmenities[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                            text: standOutAmenity.name,
                            isChecked: standOutAmenity.isActive.value,
                            onValueChanged: (value) =>
                                AppFunctions.updateCheckboxValue(
                                  newValue: value,
                                  oldValue: standOutAmenity.isActive,
                                ));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateShortletStandoutAmenities(
                  shortlet: shortlet),
              text: controller.isShorletStandoutAmenitiesUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
