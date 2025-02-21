import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/bookings_repository/car_rental_bookings_repository.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../../../common/widgets/widgets.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/app_payment_service.dart';
import '../../../../../setup/app_customer_menu.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../utils/enums/booking_status.dart';
import '../../../../auth/models/app_user.dart';
import '../../../../personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import '../../../host_menu/listings/model/car_rental_model.dart';
import '../model/car_rental_booking_model.dart';
import '../views/car_rental_bookings/car_rental_bookings_summary_view.dart';

class CarRentalBookingsController extends GetxController {
  //
  static CarRentalBookingsController get instance => Get.find();
  final CarRentalBookingsRepository _repository =
      Get.put(CarRentalBookingsRepository());
  final AppUser currentAppUser =
      CustomerProfileController.instance.currentAppUser.value;

  RxBool isCRBActiveSelected = true.obs;
  RxBool isCRBCompletedSelected = false.obs;
  RxBool isCRBCancelledSelected = false.obs;

  Rx<Color> activeTextColor = AppColors.appWhiteColor.obs;
  Rx<Color> completedTextColor = AppColors.appTextFadedColor.obs;
  Rx<Color> cancelledTextColor = AppColors.appTextFadedColor.obs;

  Rx<Color> activeTabColor = AppColors.appMainColor.obs;
  Rx<Color> completedTabColor = AppColors.appWhiteColor.obs;
  Rx<Color> cancelledTabColor = AppColors.appWhiteColor.obs;

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

  void activeCRBSelected() {
    isCRBActiveSelected.value = true;
    isCRBCancelledSelected.value = false;
    isCRBCompletedSelected.value = false;

    //
    activeTextColor.value = AppColors.appWhiteColor;
    completedTextColor.value = AppColors.appTextFadedColor;
    cancelledTextColor.value = AppColors.appTextFadedColor;
    activeTabColor.value = AppColors.appMainColor;
    completedTabColor.value = AppColors.appWhiteColor;
    cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void completedCRBSelected() {
    isCRBActiveSelected.value = false;
    isCRBCompletedSelected.value = true;
    isCRBCancelledSelected.value = false;

    //
    activeTextColor.value = AppColors.appTextFadedColor;
    completedTextColor.value = AppColors.appWhiteColor;
    cancelledTextColor.value = AppColors.appTextFadedColor;
    activeTabColor.value = AppColors.appWhiteColor;
    completedTabColor.value = AppColors.appMainColor;
    cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void cancelledCRBSelected() {
    isCRBActiveSelected.value = false;
    isCRBCompletedSelected.value = false;
    isCRBCancelledSelected.value = true;

    //
    activeTextColor.value = AppColors.appTextFadedColor;
    completedTextColor.value = AppColors.appTextFadedColor;
    cancelledTextColor.value = AppColors.appWhiteColor;
    activeTabColor.value = AppColors.appWhiteColor;
    completedTabColor.value = AppColors.appWhiteColor;
    cancelledTabColor.value = AppColors.appMainColor;
  }

  Future<void> selectTimeOfDay() async {
    final TimeOfDay? selectedTime = await AppFunctions.selectTimeOfDay();

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

  void checkoutForCarRentalBooking({required CarRentalModel carRental}) async {
    try {
      //all criteria must be fulfilled
      final AppPaymentService appPaymentService = AppPaymentService();

      final totalAmount = _calculateAmount(carRental.carPrice);

      if (totalAmount == 0.0) {
        AlertServices.warningSnackBar(
          title: "Oh snap",
          message: "Invalid amount $totalAmount",
        );
        return;
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
      await _createCarRentalBooking(
        carRental: carRental,
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

  Future<void> _createCarRentalBooking({
    required CarRentalModel carRental,
    required Map<String, dynamic> paymentIntent,
  }) async {
    try {
      final newBooking = CarRentalBookingModel(
        carRentalId: carRental.uid!,
        userId: currentAppUser.uid,
        carRentalDetails: {
          "carName": carRental.carName,
          "carPrice": carRental.carPrice,
          "carImage": carRental.carImages.first,
          "carRentalDetails": carRental.carRentalDetails
              .map((carDetail) => carDetail.toJson())
              .toList(),
          "pickUpTime": selectedTimeOfDay.value,
          "duration": selectedBookingDuration.value,
          "itenary": itenaryCon.text.isEmpty ? "" : itenaryCon.text,
          "location": carRental.address.toJson(),
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

      await _repository.createCarRentalBooking(carRentalBooking: newBooking);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CarRentalBookingModel>> fetchCarRentalBookingsByStatus(
      {required String status}) async {
    try {
      return _repository.fetchCarRentalBookingsByStatus(status: status);
    } catch (e) {
      AppDebugger.debugger(e);
      return [];
    }
  }

  double _calculateAmount(double amount) {
    final calculatedAmount =
        (int.tryParse(selectedBookingDuration.value.split(" ").first) ?? 1.0) *
            amount;

    return calculatedAmount;
  }
}
