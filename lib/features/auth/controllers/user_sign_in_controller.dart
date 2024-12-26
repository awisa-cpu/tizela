import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/auth_repository/auth_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/features/auth/views/sign_in/user_sign_in_view.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../data/services/network_service.dart';
import '../../../utils/device/app_debugger/app_debugger.dart';

class UserSignInController extends GetxController {
  static UserSignInController get instance => Get.find();

  final AuthRepository authRepo = AuthRepository.instance;
  final NetworkServiceController networkCon = NetworkServiceController.instance;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController forgotPasswordEmailController =
      TextEditingController();
  RxBool isPasswordForgotloading = false.obs;
  RxBool showPassword = false.obs;

  void onPasswordVisibilityChanged() =>
      showPassword.value = !showPassword.value;

  void loginInUser() async {
    try {
      //start the loader
      AppLoaderService.startLoader(loaderText: "Please wait, signing in...");

      //validate form
      if (!(signInFormKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      //todo: check network connectivity

      await authRepo.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passWordController.text.trim(),
      );

      _resetResources();

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
          title: "Successful login", message: "User has been logged in");

      await authRepo.userScreenDirector();
    } on FirebaseAuthException catch (_) {
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "INVALID LOGIN CRENDENTIALS");
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "something went wrong");
    }
  }

  void _resetResources() {
    signInFormKey.currentState?.reset();
    emailController.clear();
    passWordController.clear();
  }

  void logOutUser() async {
    try {
      await authRepo.signOutUser();
      Get.offAll(() => const UserSignInView());

      AlertServices.successSnackBar(
          title: "Successful", message: "User logged out successfully");
    } catch (e) {
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "Could not logout, try again");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
    forgotPasswordEmailController.dispose();
  }

  void forgotUserPassword() async {
    try {
      isPasswordForgotloading.value = true;

      if (!(forgotPasswordFormKey.currentState?.validate() ?? false)) {
        isPasswordForgotloading.value = false;
        return;
      }

      //
      await authRepo.sendPasswordResetEmail(
        email: forgotPasswordEmailController.text.trim(),
      );

      //
      forgotPasswordEmailController.clear();
      isPasswordForgotloading.value = false;

      //
      AlertServices.successSnackBar(
        title: "Please check email",
        message: "reset link sent to email address",
      );

      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "error sending password reset email");
    } finally {
      isPasswordForgotloading.value = false;
    }
  }
}
