import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../controllers/edit_host_car_rental_controller.dart';

class EditCarRentalNameView extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalNameView({
    super.key,
    required this.carRental,
  });

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Enter car name",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              hintText: "Car name",
              controller: controller.carRentalNameCon,
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateCarRentalName(carRental: carRental),
              text: controller.isCarRentalNameUpdating.value
                  ? "updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
