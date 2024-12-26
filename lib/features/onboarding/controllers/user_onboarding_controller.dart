import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tizela/features/auth/models/app_user.dart';

import '../../../setup/app_navigator.dart';
import '../../../utils/constants/app_colors.dart';

class UserOnboardingController extends GetxController {
  static UserOnboardingController get instance => Get.find();
  Rx<UserType> selectedUserType = UserType.none.obs;
  final GetStorage userStorage = GetStorage();

  //
  RxBool isHostTapped = false.obs;
  RxBool isCustomerTapped = false.obs;

  Color? hostBorderColor;
  Color? customerBorderColor;

  RxDouble hostBorderWidth = 1.0.obs;
  RxDouble customerBorderWidth = 1.0.obs;

  //
  void onCustomerValueChanged() {
    isCustomerTapped.value = true;
    isHostTapped.value = false;
    if (isCustomerTapped.value) {
      selectedUserType.value = UserType.customer;
      hostBorderColor = null;
      hostBorderWidth.value = 1.0;

      customerBorderColor = AppColors.appMainColor;
      customerBorderWidth.value = 2.0;
    }
  }

  void onHostValueChanged() {
    isHostTapped.value = true;
    isCustomerTapped.value = false;
    if (isHostTapped.value) {
      selectedUserType.value = UserType.host;
      hostBorderColor = AppColors.appMainColor;
      hostBorderWidth.value = 2.0;

      customerBorderColor = null;
      customerBorderWidth.value = 1.0;
    }
  }

  void onOnboardingBeginTap() async {
    await userStorage.write("userFirstTime", false);
    AppNagivator.pushNamedRoute(
      userSAcountTypeRoute,
    );
  }
}
