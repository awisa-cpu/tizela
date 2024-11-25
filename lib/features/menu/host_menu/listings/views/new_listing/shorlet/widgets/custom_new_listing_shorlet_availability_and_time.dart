import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/local_database.dart';

import '../../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../../../controllers/host_shorlet_controller.dart';

class CustomNewListingShorletAvailabilityAndTime extends StatelessWidget {
  const CustomNewListingShorletAvailabilityAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Set Availability & Time",
            subText:
                "Kindly set availability and lodging time for the\n apartment you are listing.",
            onTap: () {},
          ),

          //date in
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: Obx(
              () => TableCalendar(
                headerStyle: const HeaderStyle(
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  formatButtonVisible: false,
                ),
                rowHeight: 38,
                locale: 'en_US',
                availableGestures: AvailableGestures.horizontalSwipe,
                focusedDay: controller.dateInFocusedDay.value,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: controller.onDateInDateSelected,
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.dateInFocusedDay.value),
              ),
            ),
          ),

          //date out
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 13.5,
            ),
            child: Obx(
              () => TableCalendar(
                headerStyle: const HeaderStyle(
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  formatButtonVisible: false,
                ),
                rowHeight: 38,
                locale: 'en_US',
                availableGestures: AvailableGestures.horizontalSwipe,
                focusedDay: controller.dateOutFocusedDay.value,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: controller.onDateOutDateSelected,
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.dateOutFocusedDay.value),
              ),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(
                  height: 13.5,
                ),
                Text(
                  "Check in & Checkout",
                  style: customTextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.5),
                  child: Obx(
                    () => CustomDropdownForm(
                      currentValue: controller.checkInTime.value,
                      items: LocalDatabase.checkInTimes,
                      onChanged: (value) {
                        if (value != null) {
                          controller.onCheckInChanged(value);
                        }
                      },
                    ),
                  ),
                ),
                Obx(
                  () => CustomDropdownForm(
                    currentValue: controller.checkOutTime.value,
                    items: LocalDatabase.checkOutTimes,
                    onChanged: (value) {
                      if (value != null) {
                        controller.onCheckOutChanged(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 13.5, bottom: 5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(),
                Text(
                  "Minimum check in period",
                  style: customTextStyle(),
                ),
                const CustomHeight(
                  height: 13.5,
                ),
                Obx(
                  () => CustomDropdownForm(
                    currentValue: controller.minimumCheckInTime.value,
                    items: LocalDatabase.checkInPeriod,
                    onChanged: (value) {
                      if (value != null) {
                        controller.onMinimumCheckInChanged(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const CustomInfoNotificationWithText(
            text: "The default check in period is set at 1 night",
          ),
        ],
      ),
    );
  }
}