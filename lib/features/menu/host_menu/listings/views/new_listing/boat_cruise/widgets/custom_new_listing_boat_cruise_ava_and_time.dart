import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';

class CustomNewListingBoatCruiseAvaAndTime extends StatelessWidget {
  const CustomNewListingBoatCruiseAvaAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Set Availability & Time",
            subText:
                "Kindly set availability for rental placement for\n car listed..",
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
                focusedDay: controller.dateInFocused.value,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: controller.onDayInDateChanged,
                selectedDayPredicate: (day) => isSameDay(
                  day,
                  controller.dateInFocused.value,
                ),
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
                focusedDay: controller.dateOutFocused.value,
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: controller.onDayOutDateChanged,
                selectedDayPredicate: (day) => isSameDay(
                  day,
                  controller.dateOutFocused.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
