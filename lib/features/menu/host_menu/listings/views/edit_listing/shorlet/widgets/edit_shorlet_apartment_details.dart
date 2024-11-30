import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_shortlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_text_and_add_and_remove_buttons.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../model/shorlet_model.dart';

class EditShorletApartmentDetails extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletApartmentDetails({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Apartment details",
            style: customTextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomListview(
              itemCount: shortlet.apartmentDetails.length,
              itemBuilder: (_, index) {
                final apartmentDetail = shortlet.apartmentDetails[index];
                return Obx(
                  () {
                    return CustomTextAndAddAndRemoveButtons(
                      text: apartmentDetail.name,
                      count: apartmentDetail.detailCount.toString(),
                      onAdd: () => AppFunctions.incrementCount(
                        apartmentDetail.detailCount,
                      ),
                      onRemove: () => AppFunctions.decrementCount(
                        apartmentDetail.detailCount,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateShortletApartmentDetails(shortlet: shortlet),
              text: controller.isShorletApartmentDetailsUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
