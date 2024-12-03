import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../widgets/custom_edit_view.dart';

class EditCarRentalAvailability extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalAvailability({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

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
                availableGestures: AvailableGestures.all,
                focusedDay: controller.dateInSelected.value,
                firstDay: DateTime.utc(2023, 1, 30),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: (date1, date2) =>
                    AppFunctions.onDateInDateSelected(
                  date1,
                  date2,
                  dateInFocusedDay: controller.dateInSelected,
                ),
                selectedDayPredicate: (day) => isSameDay(
                  day,
                  controller.dateInSelected.value,
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
                availableGestures: AvailableGestures.all,
                focusedDay: controller.dateOutSelected.value,
                firstDay: DateTime.utc(2023, 1, 30),
                lastDay: DateTime.utc(2030, 12, 30),
                onDaySelected: (date1, date2) =>
                    AppFunctions.onDateOutDateSelected(
                  date1,
                  date2,
                  dateOutFocusedDay: controller.dateOutSelected,
                ),
                selectedDayPredicate: (day) =>
                    isSameDay(day, controller.dateOutSelected.value),
              ),
            ),
          ),

          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateCarRentalDateSelected(
                  currentCarRental: carRental),
              text: controller.isCarRentalDatesUpdating.value
                  ? "updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
