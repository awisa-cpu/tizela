import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/success_view.dart';
import '../../../../../data/repositories/bookings/boat_cruise_bookings_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/app_payment_service.dart';
import '../../../../../setup/app_customer_menu.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../utils/enums/booking_status.dart';
import '../../../../auth/models/app_user.dart';
import '../../../../personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import '../../../host_menu/listings/model/boat_cruise_model.dart';
import '../model/boat_cruise_booking_model.dart';
import '../views/boat_cruise_bookings/boat_cruise_booking_summary.dart';

class BoatCruiseBookingsController extends GetxController {
  static BoatCruiseBookingsController get instance => Get.find();

  final BoatCruiseBookingsRepository _repository =
      Get.put(BoatCruiseBookingsRepository());
  final AppUser currentAppUser =
      CustomerProfileController.instance.currentAppUser.value;

  Rx<DateTime> selectedBoatCruiseDate = DateTime.now().obs;
  RxString selectedPassengerNumber = "1".obs;
  Rx<String> selectedStartTimeOfDay = "7:00 AM".obs;
  Rx<String> selectedEndTimeOfDay = "11:00 AM".obs;

  RxBool isActiveSelected = true.obs;
  RxBool isCompletedSelected = false.obs;
  RxBool isCancelledSelected = false.obs;

  Rx<Color> activeTextColor = AppColors.appWhiteColor.obs;
  Rx<Color> completedTextColor = AppColors.appTextFadedColor.obs;
  Rx<Color> cancelledTextColor = AppColors.appTextFadedColor.obs;

  Rx<Color> activeTabColor = AppColors.appMainColor.obs;
  Rx<Color> completedTabColor = AppColors.appWhiteColor.obs;
  Rx<Color> cancelledTabColor = AppColors.appWhiteColor.obs;

  void activeSelected() {
    isActiveSelected.value = true;
    isCancelledSelected.value = false;
    isCompletedSelected.value = false;

    //
    activeTextColor.value = AppColors.appWhiteColor;
    completedTextColor.value = AppColors.appTextFadedColor;
    cancelledTextColor.value = AppColors.appTextFadedColor;
    activeTabColor.value = AppColors.appMainColor;
    completedTabColor.value = AppColors.appWhiteColor;
    cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void completedSelected() {
    isActiveSelected.value = false;
    isCompletedSelected.value = true;
    isCancelledSelected.value = false;

    //
    activeTextColor.value = AppColors.appTextFadedColor;
    completedTextColor.value = AppColors.appWhiteColor;
    cancelledTextColor.value = AppColors.appTextFadedColor;
    activeTabColor.value = AppColors.appWhiteColor;
    completedTabColor.value = AppColors.appMainColor;
    cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void cancelledSelected() {
    isActiveSelected.value = false;
    isCompletedSelected.value = false;
    isCancelledSelected.value = true;

    //
    activeTextColor.value = AppColors.appTextFadedColor;
    completedTextColor.value = AppColors.appTextFadedColor;
    cancelledTextColor.value = AppColors.appWhiteColor;
    activeTabColor.value = AppColors.appWhiteColor;
    completedTabColor.value = AppColors.appWhiteColor;
    cancelledTabColor.value = AppColors.appMainColor;
  }

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

  void checkoutForCarRentalBooking(
      {required BoatCruiseModel boatCruise}) async {
    try {
      //all criteria must be fulfilled
      final AppPaymentService appPaymentService = AppPaymentService();

      //calculate total amount
      final totalAmount = _calculateTotalAmount(boatCruise.boatFee);

      if (totalAmount == 0.0) {
        throw Exception("Something went wrong with amount:$totalAmount");
      }

      final paymentIntent = await appPaymentService.makePayment(
        amount: totalAmount.toInt(),
      );

      if (paymentIntent == null) return;

      if (paymentIntent['status'] == "failed" ||
          paymentIntent['status'] == 'requires_action') {
        AlertServices.warningSnackBar(
          title: "Oh snap",
          message: "payment error",
        );
        return;
      }

      //once payment is successful, create a booking
      await _createBoatCruiseBooking(
        boatCruise: boatCruise,
        paymentIntent: paymentIntent,
      );

      //alert user
      AppNagivator.pushRoute(
        SuccessView(
          mainText: "Booking successful",
          subText: "Booking has been successfully placed",
          onPressed: () => AppNagivator.pushAndRemovePreRoute(
            const AppCustomerMenu(),
          ),
        ),
      );

      //Exceptions handlers
    } on DioException catch (d) {
      AppDebugger.debugger(d.response?.data);
      AlertServices.errorSnackBar(title: "Internet error", message: d.message);
    } on StripeException catch (e) {
      AppDebugger.debugger(e.error);
      switch (e.error.code) {
        case FailureCode.Canceled:
          AlertServices.warningSnackBar(
              title: "Payment cancelled", message: e.error.message);

        default:
          AlertServices.errorSnackBar(
              title: "Payment error", message: e.error.message);
      }
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "An error occured");
    }
  }

  Future<void> _createBoatCruiseBooking({
    required BoatCruiseModel boatCruise,
    required Map<String, dynamic> paymentIntent,
  }) async {
    try {
      final booking = BoatCruiseBookingModel(
        boatCruiseId: boatCruise.uid!,
        userId: currentAppUser.uid,
        boatCruiseDetails: {
          "boatName": boatCruise.name,
          "boatPrice": boatCruise.boatFee,
          "boatImage": boatCruise.boatImages.first,
          "boatCruiseMaxPassenger":
              boatCruise.boatCruiseDetails.last.detailCount.value,
          "selectedBoatCruiseDate":
              selectedBoatCruiseDate.value.toIso8601String(),
          "startTime": selectedStartTimeOfDay.value,
          "endTime": selectedEndTimeOfDay.value,
          "selectedPassengerNumber":selectedPassengerNumber.value,
        },
        transactionDetails: {
          "id": paymentIntent['id'],
          "payment_method": paymentIntent['payment_method'],
          "amount": AppFunctions.formatStripeAmountToBase(
              amount: paymentIntent['amount'] as int),
          "status": paymentIntent['status'],
          "transactionId": paymentIntent['latest_charge']
        },
        bookingDateCreated: DateTime.now(),
        status: BookingStatus.paid,
      );

      await _repository.createBoatCruiseBooking(boatCruiseBooking: booking);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BoatCruiseBookingModel>> fetchBoatCruiseBookingsByStatus(
      {required String status}) async {
    try {
      return _repository.fetchBoatCruiseBookingsByStatus(status: status);
    } catch (e) {
      AppDebugger.debugger(e);
      return [];
    }
  }

  double _calculateTotalAmount(double boatCruiseAmount) {
    final starTimeOfDay =
        int.tryParse(selectedStartTimeOfDay.value.split(":").first) ?? 0;
    final endTimeOfDay =
        int.tryParse(selectedEndTimeOfDay.value.split(":").first) ?? 0;

    final finalAmount = (endTimeOfDay - starTimeOfDay) * boatCruiseAmount;

    return finalAmount;
  }
}
