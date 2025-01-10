import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../host_menu/listings/model/boat_cruise_model.dart';
import '../views/boat_cruise_bookings/boat_cruise_booking_summary.dart';

class BoatCruiseBookingSummaryController extends GetxController {
  static BoatCruiseBookingSummaryController get instance =>
      Get.find<BoatCruiseBookingSummaryController>();

  Rx<DateTime> selectedDateForBooking = DateTime.now().obs;
  RxString selectedPassengerNumber = "1".obs;
  Rx<String> selectedStartTimeOfDay = "7:00 AM".obs;
  Rx<String> selectedEndTimeOfDay = "11:00 AM".obs;

  void selectStartTime() async {
    final TimeOfDay? selectedTime = await AppFunctions.selectTimeOfDay();

    if (selectedTime != null) {
      selectedStartTimeOfDay.value =
          selectedTime.format(AppNagivator.navigatorKey.currentContext!);
    }
  }

  void selectEndTime() async {
    final TimeOfDay? selectedTime = await AppFunctions.selectTimeOfDay();

    if (selectedTime != null) {
      selectedEndTimeOfDay.value =
          selectedTime.format(AppNagivator.navigatorKey.currentContext!);
    }
  }

  void proceedToSummary({required BoatCruiseModel boatCruise}) {
    AppNagivator.pushRoute(
      BoatCruiseBookingSummary(
        boatCruise: boatCruise,
      ),
    );
  }

  void processToCheckOut() {
    // AppNagivator.pushRoute(
    //   const SuccessView(
    //       mainText: "Booking successful",
    //       subText:
    //           "Thank you for your bookings, we will get back to you as soon as possible"),
    // );
  }
}
