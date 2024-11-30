import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';

class EditShorletApartmentPrice extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletApartmentPrice({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Set Apartment Price",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomTextFormField(
              hintText: "#${shortlet.apartmentPrice}",
              controller: controller.shorletApartmentPriceCon,
            ),
          ),
          const CustomInfoNotificationWithText(
            text: "per night",
          ),
          const CustomHeight(height: 25),
          Text(
            "Set Caution fee",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomTextFormField(
              hintText: "#${shortlet.cautionFee}",
              controller: controller.shorletCautionFeeCon,
            ),
          ),
          const CustomInfoNotificationWithText(
            text: "Refundable to customers after check-out",
          ),
          const CustomHeight(height: 20),
          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateShorletPriceAndCautionFee(
                shortlet: shortlet,
              ),
              text: controller.isShorletPricesUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          ),
        ],
      ),
    );
  }
}
