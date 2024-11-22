import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

class EditCarRentalFee extends StatelessWidget {
  const EditCarRentalFee({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Set Car Price",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomTextFormField(
              hintText: "#0.00",
            ),
          ),
          const CustomInfoNotificationWithText(
            text: "per hour",
          ),
          const CustomHeight(height: 25),
          Text(
            "Set Caution fee",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomTextFormField(
              hintText: "#0.00",
            ),
          ),
          const CustomInfoNotificationWithText(
            text: "Refundable to customers after usage",
          ),
          const CustomHeight(height: 20),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
