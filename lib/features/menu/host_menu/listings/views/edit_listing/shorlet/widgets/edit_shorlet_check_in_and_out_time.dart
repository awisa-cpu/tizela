import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/edit_listing/widgets/custom_edit_view.dart';

class EditShorletCheckInAndOutTime extends StatelessWidget {
  const EditShorletCheckInAndOutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13.5),
            child: CustomColumn(
              children: [
                Text(
                  "Check in & Checkout",
                  style: customTextStyle(fontSize: 16),
                ),
                const CustomHeight(
                  height: 13.5,
                ),
                DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  enableFeedback: false,
                  value: "Check-in time",
                  items: [
                    "Check-in time",
                    "10:00AM",
                    '11:00AM',
                    '12:00PM',
                    '1:00PM',
                    '2:00PM'
                  ]
                      .map<DropdownMenuItem>((value) =>
                          DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                  onChanged: (newValue) {},
                ),
                const CustomHeight(
                  height: 15.5,
                ),
                DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  enableFeedback: false,
                  value: "Checkout time",
                  items: [
                    "Checkout time",
                    "10:00AM",
                    '11:00AM',
                    '1:00PM',
                    '3:00PM',
                    '4:00PM'
                  ]
                      .map<DropdownMenuItem>((value) =>
                          DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                  onChanged: (newValue) {},
                ),
              ],
            ),
          ),
          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
