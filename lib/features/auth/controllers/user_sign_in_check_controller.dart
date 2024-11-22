import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import '../../../utils/exceptions/user_exception.dart';
import '../views/sign_in/user_sign_in_view.dart';
import '../views/sign_up/user_signup_view.dart';

class UserSigninCheckController extends GetxController {
  static UserSigninCheckController get instance => Get.find();

  late final TextEditingController userSignInCheckController;
  GlobalKey<FormState> userSignInCheckKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    userSignInCheckController = TextEditingController();
  }

  void userCheck() async {
    try {
      AppLoaderService.startLoader(
        loaderText: "Please wait, let's confirm the user",
      );

      //check form
      final bool isFormValid = userSignInCheckKey.currentState!.validate();
      if (!isFormValid) {
        AppLoaderService.stopLoader();
        return;
      }

      //todo: check for internet connection

      final bool userFound = await AppUserRepository.instance.findUserByEmail(
        email: userSignInCheckController.text.trim(),
      );
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "user found",
        message: "Please sign in",
      );
      _resetResources();

      //navigate to the user sign in page
      if (userFound) {
        Get.to(() => const UserSignInView());
      }
    } on UserException catch (e) {
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "${e.message}, please create account",
      );
      Get.to(() => const UserSignUpView());
    } catch (e) {
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Something went wrong, try again",
      );
    }
  }

  void _resetResources() {
    userSignInCheckKey.currentState?.reset();
    userSignInCheckController.clear();
  }
}
