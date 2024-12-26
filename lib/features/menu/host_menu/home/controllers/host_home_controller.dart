import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_colors.dart';

class HostHomeController extends GetxController {
  static HostHomeController get instance => Get.find();

  ///variables
  RxBool isShorletSelected = true.obs;
  RxBool isCarRentalSelected = false.obs;
  RxBool isBoatCruiseSelected = false.obs;

  //color
  Rx<Color> shorletTextAndIconColor = AppColors.appWhiteColor.obs;
  Rx<Color> carRentalTextAndIconColor =
      AppColors.appTextFadedColor.withValues(alpha: 0.8).obs;
  Rx<Color> boatCruiseTextAndIconColor =
      AppColors.appTextFadedColor.withValues(alpha: 0.8).obs;

  Rx<Color> shorletmainAndBorderColor = AppColors.appMainColor.obs;
  Rx<Color> carRentalmainAndBorderColor = AppColors.appWhiteColor.obs;
  Rx<Color> boatCruisemainAndBorderColor = AppColors.appWhiteColor.obs;

  ///methods

  void onShorletChange() {
    isShorletSelected.value = true;
    isCarRentalSelected.value = false;
    isBoatCruiseSelected.value = false;

    if (isShorletSelected.value) {
      shorletTextAndIconColor.value = AppColors.appWhiteColor;
      shorletmainAndBorderColor.value = AppColors.appMainColor;

      //
      carRentalTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);
      boatCruiseTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);

      //
      carRentalmainAndBorderColor.value = AppColors.appWhiteColor;
      boatCruisemainAndBorderColor.value = AppColors.appWhiteColor;
    }
  }

  void onCarRentalChange() {
    isShorletSelected.value = false;
    isCarRentalSelected.value = true;
    isBoatCruiseSelected.value = false;

    if (isCarRentalSelected.value) {
      shorletTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);
      shorletmainAndBorderColor.value = AppColors.appWhiteColor;

      //
      carRentalTextAndIconColor.value = AppColors.appWhiteColor;
      boatCruiseTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);

      //
      carRentalmainAndBorderColor.value = AppColors.appMainColor;
      boatCruisemainAndBorderColor.value = AppColors.appWhiteColor;
    }
  }

  void onBoatCruiseChange() {
    isShorletSelected.value = false;
    isCarRentalSelected.value = false;
    isBoatCruiseSelected.value = true;

    if (isBoatCruiseSelected.value) {
      shorletTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);
      shorletmainAndBorderColor.value = AppColors.appWhiteColor;

      //
      carRentalTextAndIconColor.value =
          AppColors.appTextFadedColor.withValues(alpha: 0.8);
      boatCruiseTextAndIconColor.value = AppColors.appWhiteColor;

      //
      carRentalmainAndBorderColor.value = AppColors.appWhiteColor;
      boatCruisemainAndBorderColor.value = AppColors.appMainColor;
    }
  }
}
