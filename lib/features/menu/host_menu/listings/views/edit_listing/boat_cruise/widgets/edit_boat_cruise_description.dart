import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';
import '../../../new_listing/boat_cruise/widgets/custom_boat_type.dart';

class EditBoatCruiseDescription extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseDescription({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          //
          CustomGridSelectableServiceTypes(
            title: "Kindly select your Boat type",
            style: customTextStyle(),
            isThereSpaceAfterTitle: false,
            itemCount: controller.boatTypes.length,
            mainAxisExtent: 120,
            crossAxisSpacing: 25,
            itemBuilder: (context, index) {
              return Obx(
                () {
                  final boatType = controller.boatTypes[index];

                  final isBoatTypeSelected =
                      boatType == controller.selectedBoatType.value;
                  return CustomBoatType(
                    boatType: boatType,
                    isBoatSelected: isBoatTypeSelected,
                    onTap: () => AppFunctions.onBoatTypeChanged(
                      boatType: boatType,
                      selectedBoatType: controller.selectedBoatType,
                    ),
                  );
                },
              );
            },
          ),
          Text(
            "Enter Boat Description",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFormField(
              maxLines: 5,
              hintText: "Type here...",
              controller: controller.editBoatDescriptionController,
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseTypeAndDescription(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatTypeAndDescriptionUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
