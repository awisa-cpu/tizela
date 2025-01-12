import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/repositories/bookings/boat_cruise_bookings_repository.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../model/boat_cruise_booking_model.dart';

class BoatCruiseBookingsController  extends GetxController{
  static BoatCruiseBookingsController get instance => Get.find();

  final BoatCruiseBookingsRepository _repository = Get.put(BoatCruiseBookingsRepository());


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
      isCancelledSelected.value  = false;
      isCompletedSelected.value  = false;

      //
      activeTextColor.value = AppColors.appWhiteColor;
      completedTextColor.value = AppColors.appTextFadedColor;
      cancelledTextColor.value = AppColors.appTextFadedColor;
      activeTabColor.value = AppColors.appMainColor;
      completedTabColor .value= AppColors.appWhiteColor;
      cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void completedSelected() {
      isActiveSelected.value  = false;
      isCompletedSelected .value = true;
      isCancelledSelected .value = false;

      //
      activeTextColor.value = AppColors.appTextFadedColor;
      completedTextColor.value = AppColors.appWhiteColor;
      cancelledTextColor.value = AppColors.appTextFadedColor;
      activeTabColor .value= AppColors.appWhiteColor;
      completedTabColor.value = AppColors.appMainColor;
      cancelledTabColor.value = AppColors.appWhiteColor;
  }

  void cancelledSelected() {
      isActiveSelected.value  = false;
      isCompletedSelected .value = false;
      isCancelledSelected.value  = true;

      //
      activeTextColor.value = AppColors.appTextFadedColor;
      completedTextColor.value = AppColors.appTextFadedColor;
      cancelledTextColor.value = AppColors.appWhiteColor;
      activeTabColor.value = AppColors.appWhiteColor;
      completedTabColor.value = AppColors.appWhiteColor;
      cancelledTabColor.value = AppColors.appMainColor;
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
}