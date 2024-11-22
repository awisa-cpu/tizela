import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';
import 'package:tizela/features/personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

class EditShorletMinimumCheckinPeriod extends StatelessWidget {
  const EditShorletMinimumCheckinPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "Minimum check in period",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(
            height: 13.5,
          ),
          DropdownButtonFormField(
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            enableFeedback: false,
            value: "1 night",
            items: [
              "1 night",
              "2 night",
              '3 night',
              '4 night',
            ]
                .map<DropdownMenuItem>((value) =>
                    DropdownMenuItem(value: value, child: Text(value)))
                .toList(),
            onChanged: (newValue) {},
          ),
          const CustomHeight(),
          const CustomInfoNotificationWithText(
            text: "The default minimum check in period is set at 1\n  night",
          ),
          const CustomHeight(height: 20),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
