import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'dart:developer';

import 'package:tizela/data/services/app_loader_services.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  RxBool currentPasswordshouldObscureText = false.obs;
  RxBool newPasswordshouldObscureText = false.obs;
  RxBool confirmPasswordshouldObscureText = false.obs;
  late TextEditingController cPasswordCon;
  late TextEditingController nPasswordCon;
  late TextEditingController conPasswordCon;
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    cPasswordCon = TextEditingController();
    nPasswordCon = TextEditingController();
    conPasswordCon = TextEditingController();
  }

  void shouldObscureCurrentPassword() =>
      currentPasswordshouldObscureText.value =
          !currentPasswordshouldObscureText.value;

  void shouldObscureNewPassword() =>
      newPasswordshouldObscureText.value = !newPasswordshouldObscureText.value;

  void shouldObscureConfirmPassword() =>
      confirmPasswordshouldObscureText.value =
          !confirmPasswordshouldObscureText.value;

  void resetFormFields() {
    changePasswordFormKey.currentState?.reset();
    cPasswordCon.clear();
    nPasswordCon.clear();
    conPasswordCon.clear();
  }

  void savePassword() {
    AppLoaderService.showOverlayLoader(loaderText: "changing password");
    final bool isFormValid = changePasswordFormKey.currentState!.validate();
    if (!isFormValid) {
      AppLoaderService.stopLoader();
      return;
    }

    //todo: implement the process of password change

    //reset the fields
    resetFormFields();
    AppLoaderService.stopLoader();
    AlertServices.successSnackBar(
      title: "successful",
      message: "password changed!",
    );
    log("form valid to save");
  }
}
