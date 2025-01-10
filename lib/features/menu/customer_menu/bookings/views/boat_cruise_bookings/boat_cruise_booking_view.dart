import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/widgets/custom_boat_cruise_duration_selector.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/widgets/custom_boat_cruse_booking_first_section.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import '../../controller/boat_cruise_booking_summary_controller.dart';

class BoatCruiseBookingView extends StatefulWidget {
  final BoatCruiseModel boatCruise;
  const BoatCruiseBookingView({super.key, required this.boatCruise});

  @override
  State<BoatCruiseBookingView> createState() => _BoatCruiseBookingViewState();
}

class _BoatCruiseBookingViewState extends State<BoatCruiseBookingView> {
  @override
  void initState() {
    super.initState();
    AppDeviceServices.restoreStatusBar();
  }

  @override
  void dispose() {
    AppDeviceServices.hideStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BoatCruiseBookingSummaryController());

    //
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Booking",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          spacing: 30,
          children: [
            CustomBoatCruseBookingFirstSection(
              boatCruise: widget.boatCruise,
            ),
            CustomColumn(
              children: [
                Text(
                  "Select date you would like \nto go on the cruise",
                  style: customTextStyle(fontSize: 16),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: TableCalendar(
                      headerStyle: const HeaderStyle(
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        formatButtonVisible: false,
                      ),
                      rowHeight: 38,
                      locale: 'en_US',
                      availableGestures: AvailableGestures.all,
                      focusedDay: controller.selectedDateForBooking.value,
                      firstDay: DateTime.utc(2023, 1, 30),
                      lastDay: DateTime.utc(2030, 12, 30),
                      onDaySelected: (d1, d2) =>
                          AppFunctions.onDateInDateSelected(
                              d1, d2,
                              dateInFocusedDay:
                                  controller.selectedDateForBooking),
                      selectedDayPredicate: (day) => isSameDay(
                          day, controller.selectedDateForBooking.value),
                    ),
                  ),
                ),

                //
                Text(
                  "How many passengers?",
                  style: customTextStyle(fontSize: 16),
                ),

                //
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Obx(
                    () => CustomDropdownForm(
                      currentValue: controller.selectedPassengerNumber.value,
                      items: List.generate(
                          widget.boatCruise.boatCruiseDetails.last.detailCount
                                      .value <=
                                  0
                              ? 0
                              : widget.boatCruise.boatCruiseDetails.last
                                  .detailCount.value,
                          (index) => (index + 1).toString()),
                      onChanged: (newValue) =>
                          AppFunctions.updateCheckboxStringValue(
                              newValue: newValue,
                              oldValue: controller.selectedPassengerNumber),
                    ),
                  ),
                ),

                //
                const CustomBoatCruiseDurationSelector(),
                const CustomHeight(height: 10),
                CustomEleButton(
                  onPressed: () => controller.proceedToSummary(
                    boatCruise: widget.boatCruise,
                  ),
                  text: "Proceed",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
