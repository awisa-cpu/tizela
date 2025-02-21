import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/services/alert_services.dart';

import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  final AuthRepository authRepo = AuthRepository.instance;
  RxBool currentPasswordshouldObscureText = false.obs;
  RxBool newPasswordshouldObscureText = false.obs;
  RxBool confirmPasswordshouldObscureText = false.obs;
  late TextEditingController currentPasswordCon;
  late TextEditingController newPasswordCon;
  late TextEditingController conPasswordCon;
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    currentPasswordCon = TextEditingController();
    newPasswordCon = TextEditingController();
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
    currentPasswordCon.clear();
    newPasswordCon.clear();
    conPasswordCon.clear();
  }

  void updatePassword() async {
    try {
      AppLoaderService.showOverlayLoader(loaderText: "changing password");

      //check if the form is valid
      if (!(changePasswordFormKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      //update the password
      await _updateUserPassword();

      //reset the fields
      resetFormFields();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "successful",
        message: "password changed!",
      );
      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      resetFormFields();
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Error changing password",
      );
    }
  }

  Future<void> _updateUserPassword() async {
    try {
      if (authRepo.currentUser == null) return;
      final userEmail = authRepo.currentUser!.email;

      //update
      await authRepo.updateUserPasswordWithEmail(
        email: userEmail!,
        currentPassword: currentPasswordCon.text,
        newPassword: newPasswordCon.text,
      );
    } catch (e) {
      rethrow;
    }
  }
}
