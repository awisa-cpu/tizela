import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/auth_repository/auth_repository.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../utils/device/app_debugger/app_debugger.dart';
import '../../../utils/formatters/app_date_formatter.dart';

class UserSignUpController extends GetxController {
  static UserSignUpController get instance => Get.find();

  final AuthRepository authRepo = AuthRepository.instance;
  // final UserOnboardingController onBoardController =
  //     UserOnboardingController.instance;
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  late final TextEditingController fNameCon;
  late final TextEditingController lNameCon;
  late final TextEditingController emailCon;
  late final TextEditingController birthdayCon;
  late final TextEditingController passwordCon;
  late final TextEditingController phoneCon;
  Rx<UserType> selectedUserType = UserType.none.obs;
  RxString selectedDobString = "Birthday".obs;
  DateTime? dobSelected;
  RxBool isCustomer = false.obs;
  RxBool isHost = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameCon = TextEditingController();
    lNameCon = TextEditingController();
    emailCon = TextEditingController();
    birthdayCon = TextEditingController();
    passwordCon = TextEditingController();
    phoneCon = TextEditingController();
  }

  void onCustomerValueChanged(bool? value) {
    isCustomer.value = true;
    isHost.value = false;
    if (isCustomer.value) {
      selectedUserType.value = UserType.customer;
    }
  }

  void onHostValueChanged(bool? value) {
    isHost.value = true;
    isCustomer.value = false;
    if (isHost.value) {
      selectedUserType.value = UserType.host;
    }
  }

  Future<void> selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1940),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );

    if (selectedDate != null) {
      dobSelected = selectedDate;
      selectedDobString.value = AppDateFormater.formatDate(date: selectedDate);
    }
  }

  void signUpUser() async {
    try {
      AppLoaderService.startLoader(
          loaderText: "Creating account please wait...");

      //validate form data
      final bool isFormValid = signUpFormKey.currentState!.validate();
      if (!isFormValid) {
        AppLoaderService.stopLoader();
        return;
      }

      //todo: check for network connectivity

      //sign up the user
      final UserCredential userCredential =
          await authRepo.createUserWithEmailAndPassword(
        email: emailCon.text.trim(),
        password: passwordCon.text.trim(),
      );

      await _createUser(newUserCredential: userCredential);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Success",
        message: "User regsitered successfully",
      );

      //todo: go to verify email view from here and not login
      //navigate to login now
      AppNagivator.pushNamedRoute(
        userSignInRoute,
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh shit",
        message: "Something went wrong",
      );
    }
  }

  Future<void> _createUser({required UserCredential newUserCredential}) async {
    try {
      //save to database
      final AppUser newUser = AppUser(
        uid: newUserCredential.user!.uid,
        userType: selectedUserType.value,
        emailAddress: emailCon.text.trim(),
        firstName: fNameCon.text.trim(),
        lastName: lNameCon.text.trim(),
        phoneNumber: phoneCon.text.trim(),
        dob: dobSelected ?? DateTime.now(),
      );

      await AppUserRepository.instance.createNewUser(newUser);
    } catch (e) {
      rethrow;
    }
  }

  void _resetResources() {
    signUpFormKey.currentState?.reset();
    fNameCon.clear();
    lNameCon.clear();
    emailCon.clear();
    birthdayCon.clear();
    passwordCon.clear();
    phoneCon.clear();
  }
}
