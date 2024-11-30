import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/widgets/widgets.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_shortlet_controller.dart';
import '../../../../model/shorlet_model.dart';
import '../../widgets/custom_edit_view.dart';

class EditShorletAvailability extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletAvailability({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;

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
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: (date1, date2) =>
                    AppFunctions.onDateInDateSelected(
                  date1,
                  date2,
                  dateInFocusedDay: controller.dateInFocusedDay,
                ),
                selectedDayPredicate: (day) => isSameDay(
                  day,
                  controller.dateInFocusedDay.value,
                ),
              ),
            ),
          ),

          //date out
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
                focusedDay: controller.dateOutFocusedDay.value,
                firstDay: DateTime.now(),
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
              onPressed: () =>
                  controller.updateShortletAvailability(shortlet: shortlet),
              text: controller.isShorletAvailabilityUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
