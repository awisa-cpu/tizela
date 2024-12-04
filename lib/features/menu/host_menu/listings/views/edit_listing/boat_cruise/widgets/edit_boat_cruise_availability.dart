import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/widgets/widgets.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_boat_cruise_controller.dart';
import '../../../../model/boat_cruise_model.dart';
import '../../widgets/custom_edit_view.dart';

class EditBoatCruiseAvailability extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const EditBoatCruiseAvailability({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostBoatCruiseController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          //date in
          Padding(
            padding: const EdgeInsets.only(bottom: 13.5),
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
                firstDay: DateTime.utc(2023, 1, 30),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: (date1, date2) =>
                    AppFunctions.onDateInDateSelected(
                  date1,
                  date2,
                  dateInFocusedDay: controller.dateInFocusedDay,
                ),
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
                firstDay: DateTime.utc(2023, 1, 30),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: (date1, date2) =>
                    AppFunctions.onDateOutDateSelected(
                  date1,
                  date2,
                  dateOutFocusedDay: controller.dateOutFocusedDay,
                ),
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.dateOutFocusedDay.value),
              ),
            ),
          ),

          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateBoatCruiseAvailability(
                currentBoatCruise: boatCruise,
              ),
              text: controller.isBoatAvailabilityUpdating.value
                  ? "update in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
