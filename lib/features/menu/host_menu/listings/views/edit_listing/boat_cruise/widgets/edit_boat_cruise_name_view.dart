import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/validators/app_validators.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';

class EditBoatCruiseNameView extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseNameView({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: Form(
        key: controller.editBoatNameKey,
        child: CustomColumn(
          children: [
            Text(
              "Enter Boat name",
              style: customTextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: CustomTextFormField(
                hintText: "Boat Name",
                controller: controller.editBoatNameController,
                validator: (value) => AppValidators.validateTextField(value,
                    fieldName: "boat name"),
              ),
            ),
            Obx(
              () => CustomEleButton(
                onPressed: () => controller.updateBoatCruiseName(
                    currentBoatCruise: boatCruise),
                text: controller.isBoatNameUpdating.value
                    ? "updating in progress..."
                    : "Save",
              ),
            )
          ],
        ),
      ),
    );
  }
}
