import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/auth_repository/auth_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/features/auth/views/sign_in/user_sign_in_view.dart';

import '../../../data/services/network_service.dart';

class UserSignInController extends GetxController {
  static UserSignInController get instance => Get.find();

  final AuthRepository authRepo = AuthRepository.instance;
  final NetworkServiceController networkCon =
      NetworkServiceController.instance;

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  RxBool showPassword = false.obs;

  void onPasswordVisibilityChanged() =>
      showPassword.value = !showPassword.value;

  void loginInUser() async {
    try {
      //start the loader
      AppLoaderService.startLoader(loaderText: "Please wait, signing in...");

      //validate form
      final isFormValid = signInFormKey.currentState!.validate();
      if (!isFormValid) {
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
      // print(e);
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
  }
}
