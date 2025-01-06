import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../setup/app_navigator.dart';

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

  static void showSnackBar({required String content}) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        content,
        style: customTextStyle(),
      ),
      backgroundColor: Colors.white,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

    ScaffoldMessenger.maybeOf(AppNagivator.navigatorKey.currentContext!)
        ?.showSnackBar(snackBar);
  }
}
