import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_payment_service.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/controller/customer_profile_controller.dart';

import '../../../../../data/repositories/bookings/shortlet_booking_repository.dart';
import '../../../../../setup/setup.dart';
import '../../../host_menu/listings/model/shortlet_model.dart';
import '../../home/views/home_view.dart';

class ShortletBookingSummaryController extends GetxController {
  static ShortletBookingSummaryController get instance => Get.find();

  final controller = Get.put(ShortletBookingRepository());
  RxBool isSamePersonCheckIn = true.obs;
  RxBool isSomeoneElseCheckIn = false.obs;
  final AppUser currentAppUser =
      CustomerProfileController.instance.currentAppUser.value;

  final GlobalKey<FormState> shortletBookingFormKey = GlobalKey<FormState>();
  int _finalCost = 0;

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
    final differenceInDays = shortletModel.availableDates[1]
        .difference(shortletModel.availableDates[0]);
    if (shouldreturnOnlyvalue) {
      if (differenceInDays.inDays <= 0) {
        return "0";
      } else {
        return differenceInDays.inDays.toString();
      }
    }
    if (differenceInDays.inDays <= 0) {
      return "0 days";
    }
    return "${differenceInDays.inDays.toString()} days";
  }

  double calculateCostByDays({required ShortletModel shortletModel}) {
    final daysValue = double.tryParse(
          getNumberOfDays(
            shouldreturnOnlyvalue: true,
            shortletModel: shortletModel,
          ),
        ) ??
        1.0;
    final totalCost = daysValue * shortletModel.apartmentPrice;

    return totalCost;
  }

  int calculateFinalCost({required ShortletModel shortletModel}) {
    final finalCost = (calculateCostByDays(shortletModel: shortletModel) +
            shortletModel.cautionFee)
        .round();
    _finalCost = finalCost;
    return finalCost;
  }

  void makePayment({required ShortletModel shortlet}) async {
    try {
      //all criteria must be fulfilled
      final AppPaymentService appPaymentService = AppPaymentService();

      if (_finalCost == 0) return;

      await appPaymentService.makePayment(
        amount: _finalCost,
        merchantName: currentAppUser.userFullName,
      );

      //once payment is successful, create a booking
      await _createShortletBooking(shortlet);

      //alert user
      AlertServices.successSnackBar(
        title: "successful",
        message: "payment confirmed",
      );
      //navigate to home once done
      AppNagivator.pushRoute(const HomeView());
    } on DioException catch (d) {
      AlertServices.errorSnackBar(title: "Internet error", message: d.message);
    } on StripeException catch (e) {
      switch (e.error.code) {
        case FailureCode.Canceled:
          AlertServices.warningSnackBar(
              title: "Payment cancelled", message: e.error.message);

        default:
          AlertServices.errorSnackBar(
              title: "Payment error", message: e.error.message);
      }
    } catch (e) {
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "An error occured");
    }

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

    // AppDebugger.debugger(
    //     "Thank you for your bookings, we will get back to you as soon as possible");
  }

  Future<void> _createShortletBooking(ShortletModel shortlet) async {
    try {
      // final ShortletBookingModel shortletBooking = ShortletBookingModel(
      //   shortlet: shortlet,
      //   bookingDate: DateTime.now(),
      //   status: BookingStatus.paid,
      //   userDetails: isSamePersonCheckIn.value
      //       ? {
      //           "firstName": currentAppUser.firstName,
      //           "lastName": currentAppUser.lastName,
      //           "emailAddress": currentAppUser.emailAddress,
      //           "phoneNumber": currentAppUser.phoneNumber,
      //         }
      //       : {
      //           "firstName": firstName.value,
      //           "lastName": lastName.value,
      //           "emailAddress": emailAddress.value,
      //           "phoneNumber": phoneNumber.value,
      //         },
      // );

      // await controller.createShortletBooking(shortletBooking);
    } catch (e) {
      rethrow;
    }
  }
}
