import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';

class EditShorletSafetyView extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletSafetyView({super.key, required this.shortlet});

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
                const CustomDivider(),
                Text(
                  "Safety",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: shortlet.safetyFeatures.length,
                  itemBuilder: (_, index) {
                    final safetyFeature = shortlet.safetyFeatures[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: safetyFeature.name,
                          isChecked: safetyFeature.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: safetyFeature.isActive,
                          ),
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
                  controller.updateShortletSafetyFeatures(shortlet: shortlet),
              text: controller.isShorletSafetyFeaturesUpdating.value
                  ? "Updating in progress"
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
