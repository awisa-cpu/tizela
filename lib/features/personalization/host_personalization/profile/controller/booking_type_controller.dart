import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/enums/booking_type.dart';

import '../../../../../utils/constants/app_colors.dart';

class BookingTypeController extends GetxController {
  static BookingTypeController get instance => Get.find();

  RxBool isInstantHostTapped = false.obs;
  RxBool isApproveDeclineTapped = false.obs;

  Color? instantBorderColor = Colors.grey.withValues(alpha: 0.5);
  Color? approveDeclineBorderColor = Colors.grey.withValues(alpha: 0.5);

  RxDouble instantBorderWidth = 1.0.obs;
  RxDouble approveDeclineBorderWidth = 1.0.obs;

  // selected booking type
  Rx<BookingType> selectedBookingType = BookingType.none.obs;

  void onInstantBookingTapped() {
    isInstantHostTapped.value = true;
    isApproveDeclineTapped.value = false;

    //
    if (isInstantHostTapped.value) {
      selectedBookingType.value = BookingType.instant;
      instantBorderColor = AppColors.appMainColor;
      instantBorderWidth.value = 2.0;

      approveDeclineBorderColor = Colors.grey.withValues(alpha: 0.5);
      approveDeclineBorderWidth.value = 1.0;
    }

  }

  void onApproveDeclineRequestTapped() {
    isInstantHostTapped.value = false;
    isApproveDeclineTapped.value = true;

    //
    if (isApproveDeclineTapped.value) {
      selectedBookingType.value = BookingType.approve;
      instantBorderColor = Colors.grey.withValues(alpha: 0.5);
      instantBorderWidth.value = 1.0;

      approveDeclineBorderColor = AppColors.appMainColor;
      approveDeclineBorderWidth.value = 2.0;
    }
  }
}
