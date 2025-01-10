import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../host_menu/listings/model/car_rental_model.dart';
import '../views/car_rental_bookings/car_rental_bookings_summary_view.dart';

class CarRentalBookingSummaryController extends GetxController {
  static CarRentalBookingSummaryController get instance => Get.find();

  late TextEditingController itenaryCon;
  RxString selectedBookingDuration = "1 hour".obs;
  RxString selectedTimeOfDay = "7:00 AM".obs;

  @override
  void onInit() {
    super.onInit();
    itenaryCon = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    itenaryCon.dispose();
  }

  Future<void> selectTimeOfDay() async {
    final TimeOfDay? selectedTime = await  AppFunctions.selectTimeOfDay();

    if (selectedTime != null) {
      selectedTimeOfDay.value =
          selectedTime.format(AppNagivator.navigatorKey.currentContext!);
    }
  }

  void proceedTocheckout({required CarRentalModel carRental}) {
    AppNagivator.pushRoute(
      CarRentalBookingSummary(
        carRental: carRental,
      ),
    );
  }

  void checkoutCarRental() {
    /*
    AppNagivator.pushRoute(
                const SuccessView(
                    mainText: "Booking successful",
                    subText:
                        "Thank you for your bookings, we will get back to you as soon as possible"),
              ),

    */
  }
}
