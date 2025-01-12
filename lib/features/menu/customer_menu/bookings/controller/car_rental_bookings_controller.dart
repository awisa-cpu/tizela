import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/bookings/car_rental_bookings_repository.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../model/car_rental_booking_model.dart';

class CarRentalBookingsController extends GetxController {
  //
  static CarRentalBookingsController get instance => Get.find();
  final CarRentalBookingsRepository _repository =
      Get.put(CarRentalBookingsRepository());
  
  RxBool isCRBActiveSelected = true.obs;
    RxBool isCRBCompletedSelected = false.obs;
    RxBool isCRBCancelledSelected = false.obs;

  Rx<Color> activeTextColor = AppColors.appWhiteColor.obs;
    Rx<Color> completedTextColor = AppColors.appTextFadedColor.obs;
    Rx<Color> cancelledTextColor = AppColors.appTextFadedColor.obs;

  Rx<Color> activeTabColor = AppColors.appMainColor.obs;
   Rx<Color> completedTabColor = AppColors.appWhiteColor.obs;
    Rx<Color> cancelledTabColor = AppColors.appWhiteColor.obs;


     void activeCRBSelected() {
      isCRBActiveSelected.value = true;
      isCRBCancelledSelected.value = false;
      isCRBCompletedSelected .value= false;

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
      isCRBCancelledSelected .value= false;

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
      isCRBCompletedSelected .value= false;
      isCRBCancelledSelected.value = true;

      //
      activeTextColor.value = AppColors.appTextFadedColor;
      completedTextColor.value = AppColors.appTextFadedColor;
      cancelledTextColor.value = AppColors.appWhiteColor;
      activeTabColor .value= AppColors.appWhiteColor;
      completedTabColor.value = AppColors.appWhiteColor;
      cancelledTabColor .value= AppColors.appMainColor;

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
}
