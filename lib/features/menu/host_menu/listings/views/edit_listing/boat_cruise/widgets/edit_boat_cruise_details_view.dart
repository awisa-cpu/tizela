import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';

class EditBoatCruiseDetailsView extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseDetailsView({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Boat details",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: boatCruise.boatCruiseDetails.length,
              itemBuilder: (_, index) {
                final detail = boatCruise.boatCruiseDetails[index];
                return Obx(
                  () {
                    return CustomTextAndAddAndRemoveButtons(
                      text: detail.name,
                      count: detail.detailCount.value.toString(),
                      style: customTextStyle(fontWeight: FontWeight.w500),
                      onRemove: () =>
                          AppFunctions.decrementCount(detail.detailCount),
                      onAdd: () =>
                          AppFunctions.incrementCount(detail.detailCount),
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseDetails(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatDetailsUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
