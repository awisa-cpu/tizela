import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

import '../../../../../../../../data/local_database.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shortlet_model.dart';

class EditShorletMinimumCheckinPeriod extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletMinimumCheckinPeriod({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Minimum check in period",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(
            height: 13.5,
          ),
          Obx(
            () => CustomDropdownForm(
              currentValue: controller.minimumCheckInValue.value,
              items: LocalDatabase.checkInPeriod,
              onChanged: (value) => AppFunctions.updateCheckboxStringValue(
                newValue: value,
                oldValue: controller.minimumCheckInValue,
              ),
            ),
          ),
          const CustomHeight(),
          const CustomInfoNotificationWithText(
            text: "The default minimum check in period is set at 1\n  night",
          ),
          const CustomHeight(height: 20),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateShortletMinimumCheckInPeriod(
                shorlet: shortlet,
              ),
              text: controller.isShorletMinimumCheckInPeriodUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
