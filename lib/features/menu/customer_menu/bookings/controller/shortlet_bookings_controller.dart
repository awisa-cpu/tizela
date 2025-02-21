import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/shortlet_booking_model.dart';
import 'package:tizela/setup/setup.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';

import '../../../../../common/widgets/widgets.dart';
import '../../../../../data/repositories/bookings_repository/shortlet_booking_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/app_payment_service.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/enums/booking_status.dart';
import '../../../../auth/models/app_user.dart';
import '../../../../personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import '../../../host_menu/listings/model/shortlet_model.dart';

class ShortletBookingsController extends GetxController {
  static ShortletBookingsController get instance => Get.find();

  final ShortletBookingRepository _bookingRepo =
      Get.put(ShortletBookingRepository());
  final AppUser currentAppUser =
      CustomerProfileController.instance.currentAppUser.value;
  //
  RxBool isSamePersonCheckIn = true.obs;
  RxBool isSomeoneElseCheckIn = false.obs;

  final GlobalKey<FormState> shortletBookingFormKey = GlobalKey<FormState>();
  int _finalCost = 0;

  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString emailAddress = "".obs;
  RxString phoneNumber = "".obs;

  RxBool isActiveSelected = true.obs;
  RxBool isCompletedSelected = false.obs;
  RxBool isCancelledSelected = false.obs;

  Rx<Color> activeTextColor = AppColors.appWhiteColor.obs;
  Rx<Color> completedTextColor = AppColors.appTextFadedColor.obs;
  Rx<Color> cancelledTextColor = AppColors.appTextFadedColor.obs;

  Rx<Color> activeTabColor = AppColors.appMainColor.obs;
  Rx<Color> completedTabColor = AppColors.appWhiteColor.obs;
  Rx<Color> cancelledTabColor = AppColors.appWhiteColor.obs;

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

  String getNumberOfDays(
      {required List<DateTime> availableDates,
      bool shouldreturnOnlyvalue = false}) {
    final differenceInDays = availableDates[1].difference(availableDates[0]);
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
            availableDates: shortletModel.availableDates,
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

  void checkOutForShortletBooking({required ShortletModel shortlet}) async {
    try {
      //all criteria must be fulfilled
      final AppPaymentService appPaymentService = AppPaymentService();

      if (_finalCost <= 0 || _finalCost > 1000000) {
        AlertServices.warningSnackBar(
            title: "Oh snap", message: "Check amount");
        return;
      }

      final paymentIntent = await appPaymentService.makePayment(
        amount: _finalCost,
      );

      if (paymentIntent == null) return;

      if (paymentIntent['status'] == "failed" ||
          paymentIntent['status'] == 'requires_action') {
        AlertServices.warningSnackBar(
            title: "Oh snap", message: "payment error");
        return;
      }


      //once payment is successful, create a booking
      await _createShortletBooking(
        shortlet: shortlet,
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

  Future<void> _createShortletBooking(
      {required ShortletModel shortlet,
      required Map<String, dynamic> paymentIntent}) async {
    try {
      final ShortletBookingModel shortletBooking = ShortletBookingModel(
        shortletId: shortlet.uid!,
        userId: currentAppUser.uid,
        shortletDetails: {
          "shortletName": shortlet.apartmentName,
          "shortletPrice": shortlet.apartmentPrice,
          "shortletCautionFee": shortlet.cautionFee,
          "shortletImage": shortlet.apartmentImages.first,
          "startDate": shortlet.availableDates.first.toIso8601String(),
          "endDate": shortlet.availableDates.last.toIso8601String(),
        },
        bookingUserDetails: isSamePersonCheckIn.value
            ? {
                "firstName": currentAppUser.firstName,
                "lastName": currentAppUser.lastName,
                "email": currentAppUser.emailAddress,
                "phoneNumber": currentAppUser.phoneNumber,
              }
            : {
                "firstName": firstName.value,
                "lastName": lastName.value,
                "email": emailAddress.value,
                "phoneNumber": phoneNumber.value,
              },
        transactionDetails: {
          "id": paymentIntent['id'],
          "payment_method": paymentIntent['payment_method'],
          "amount": AppFunctions.formatStripeAmountToBase(amount: paymentIntent['amount'] as int),
          "status": paymentIntent['status'],
          "transactionId": paymentIntent['latest_charge']
        },
        status: BookingStatus.paid,
        bookingDateCreated: DateTime.now(),
        bookingType: shortlet.bookingType,
        totalAmountPaid: _finalCost.toDouble(),
      );

      await _bookingRepo.createShortletBooking(shortletBooking);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ShortletBookingModel>> fetchBookingsByStatus(
      {required String status}) async {
    try {
      return _bookingRepo.getShortletBookingsByStatus(status: status);
    } catch (e) {
      AppDebugger.debugger(e);
      return [];
    }
  }
}
