import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../common/widgets/custom_grid_selectable_service_types.dart';
import '../../../../../../customer_menu/home/views/search_and_filter_views/widgets/custom_apartment_type.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';
import '../../widgets/custom_edit_view.dart';

class EditShorletApartmentTypeView extends StatelessWidget {
  final ShortletModel shorlet;
  const EditShorletApartmentTypeView({super.key, required this.shorlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomGridSelectableServiceTypes(
            title: "Kindly select your apartment type",
            style: customTextStyle(fontSize: 16),
            isThereSpaceAfterTitle: true,
            itemCount: controller.apartmentTypes.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final apartmentType = controller.apartmentTypes[index];

                final isApartmentSelected =
                    apartmentType == controller.selectedApartment.value;
                return CustomApartmentType(
                  apartmentType: apartmentType,
                  apartmentImageSelected: isApartmentSelected,
                  onTap: () =>
                      controller.onSelectedApartmentUpdate(apartmentType),
                );
              });
            },
          ),

          //
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateApartmentType(shortlet: shorlet),
              text: controller.isApartmentTypeUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
