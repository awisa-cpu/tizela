import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class AlertServices {
  ///success snackbar to show
  static successSnackBar({required title, message = '', int duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.appWhiteColor,
        backgroundColor: AppColors.appMainColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.check,
          color: AppColors.appWhiteColor,
        ));
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.appWhiteColor,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: AppColors.appWhiteColor,
        ));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AppColors.appWhiteColor,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: AppColors.appWhiteColor,
        ));
  }
}
