import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/shortlet_booking_model.dart';

import '../../../../../data/repositories/bookings/shortlet_booking_repository.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';

class ShortletBookingsController extends GetxController {
  static ShortletBookingsController get to => Get.find();

  final ShortletBookingRepository _repository =
      Get.put(ShortletBookingRepository());
  final List<ShortletBookingModel> shortletBookings = [];

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

  Future<List<ShortletBookingModel>> fetchBookingsByStatus({required String status}) async {
    try {
      return  _repository.getShortletBookingsByStatus(status: status);
    } catch (e) {
      AppDebugger.debugger(e);
      return [];
    }
  }

  List<ShortletBookingModel> fetchFilteredBookingsByStatus(
      {required String status}) {
    final filtered = shortletBookings
        .where((booking) => booking.status.name == status)
        .toList();
    AppDebugger.debugger(
        "are both list same? ${shortletBookings.length == filtered.length}");
    return filtered;
  }
}
