import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../host_menu/listings/model/shortlet_model.dart';

class ShortletBookingSummaryController extends GetxController {
  static ShortletBookingSummaryController get instance => Get.find();

  RxBool isSamePersonCheckIn = true.obs;
  RxBool isSomeoneElseCheckIn = false.obs;
  final AppUser currentAppUser =
      CustomerProfileController.instance.currentAppUser.value;

  final GlobalKey<FormState> shortletBookingFormKey = GlobalKey<FormState>();

  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString emailAddress = "".obs;
  RxString phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initValues();
  }

  void _initValues() {
    if (isSamePersonCheckIn.value) {
      firstName.value = currentAppUser.firstName;
      lastName.value = currentAppUser.lastName;
      emailAddress.value = currentAppUser.emailAddress;
      phoneNumber.value = currentAppUser.phoneNumber;
    } else {
      firstName.value = "";
      lastName.value = "";
      emailAddress.value = "";
      phoneNumber.value = "";
    }
  }

  void updateSamePersonCheckBoxValue() {
    isSamePersonCheckIn.value = true;
    isSomeoneElseCheckIn.value = false;
    _initValues();
  }

  void updateSomeoneElseCheckBoxValue() {
    isSamePersonCheckIn.value = false;
    isSomeoneElseCheckIn.value = true;
    _initValues();
  }

  String getNumberOfDays(
      {required ShortletModel shortletModel,
      bool shouldreturnOnlyvalue = false}) {
    final day = shortletModel.availableDates[1]
        .difference(shortletModel.availableDates[0]);
    if (shouldreturnOnlyvalue) {
      if (day.inDays <= 0) {
        return "0";
      } else {
        return day.inDays.toString();
      }
    }
    if (day.inDays <= 0) {
      return "0 days";
    }
    return "${day.inDays.toString()} days";
  }

  double calculateCostByDays({required ShortletModel shortletModel}) {
    final daysValue = double.tryParse(getNumberOfDays(
            shouldreturnOnlyvalue: true, shortletModel: shortletModel)) ??
        1.0;
    final totalCost = daysValue * shortletModel.apartmentPrice;

    return totalCost;
  }

  int calculateFinalCost({required ShortletModel shortletModel}) {
    final finalCost = (calculateCostByDays(shortletModel: shortletModel) +
            shortletModel.cautionFee)
        .round();
    return finalCost;
  }

  void makePayment() {
    //make payment
    //send email
    //send sms
    //update booking status
    //update shortlet status
    //update user status
    //update user booking history
    //update shortlet booking history
    //update user wallet
    //update shortlet wallet
    //update user notification
    //update shortlet notification
    //update user rating
    //update shortlet rating
    //update user review
    //update shortlet review
    //update user profile
    //update shortlet profile
    //update user activity
    //update shortlet activity
    //   const SuccessView(
    //       mainText: "Booking successful",
    //       subText:
    //           "Thank you for your bookings, we will get back to you as soon as possible"),
    // ),

    AppDebugger.debugger(
        "Thank you for your bookings, we will get back to you as soon as possible");
  }
}
