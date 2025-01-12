import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../data/local_database.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shortlet_model.dart';

class EditShorletCheckInAndOutTime extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletCheckInAndOutTime({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13.5),
            child: CustomColumn(
              children: [
                Text(
                  "Check in & Checkout",
                  style: customTextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.5),
                  child: Obx(
                    () => CustomDropdownForm(
                        currentValue: controller.checkInValue.value,
                        items: LocalDatabase.checkInTimes,
                        onChanged: (value) =>
                            AppFunctions.updateCheckboxStringValue(
                              newValue: value,
                              oldValue: controller.checkInValue,
                            )),
                  ),
                ),
                Obx(
                  () => CustomDropdownForm(
                    currentValue: controller.checkOutValue.value,
                    items: LocalDatabase.checkOutTimes,
                    onChanged: (value) =>
                        AppFunctions.updateCheckboxStringValue(
                      newValue: value,
                      oldValue: controller.checkOutValue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateShortletCheckInAndOutTime(
                shorlet: shortlet,
              ),
              text: controller.isShorletCheckInOutTimeUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
