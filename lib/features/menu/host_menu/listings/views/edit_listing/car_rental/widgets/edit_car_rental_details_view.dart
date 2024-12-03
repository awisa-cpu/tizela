import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';

class EditCarRentalDetailsView extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalDetailsView({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Car details",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: carRental.carRentalDetails.length,
              itemBuilder: (_, index) {
                final detail = carRental.carRentalDetails[index];
                return Obx(
                  () => CustomTextAndAddAndRemoveButtons(
                    text: detail.name,
                    count: detail.detailCount.value.toString(),
                    style: customTextStyle(fontWeight: FontWeight.w500),
                    onRemove: () =>
                        AppFunctions.decrementCount(detail.detailCount),
                    onAdd: () =>
                        AppFunctions.incrementCount(detail.detailCount),
                  ),
                );
              },
            ),
          ),
          CustomEleButton(
            onPressed: () => controller.updateCarRentalDetails(
              currentCarRental: carRental,
            ),
            text: controller.isCarRentalDetailsUpdating.value
                ? "updating in progress..."
                : "Save",
          )
        ],
      ),
    );
  }
}
