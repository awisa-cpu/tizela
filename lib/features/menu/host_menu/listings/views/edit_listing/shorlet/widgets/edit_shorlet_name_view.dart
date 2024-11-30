import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_shortlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/utils/validators/app_validators.dart';

import '../../../../model/shorlet_model.dart';

class EditShorletNameView extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletNameView({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: Form(
        key: controller.apartmentNameKey,
        child: CustomColumn(
          children: [
            Text(
              "Enter apartment name",
              style: customTextStyle(fontSize: 16),
            ),
            const CustomHeight(height: 15),
            CustomTextFormField(
              controller: controller.shorletNameCon,
              hintText: "Apartment name",
              validator: (value) => AppValidators.validateTextField(value,
                  fieldName: "apartment name"),
            ),
            const CustomHeight(height: 20),
            Obx(
              ()=> CustomEleButton(
                onPressed: () => controller.updateShortletName(shorlet: shortlet),
                text: controller.isShorletNameUpdating.value? "Update in progress..." : "Save",
              ),
            )
          ],
        ),
      ),
    );
  }
}
