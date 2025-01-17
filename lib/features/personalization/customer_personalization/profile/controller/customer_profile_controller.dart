import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/auth_repository/auth_repository.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import '../../../../../setup/app_navigator.dart';

class CustomerProfileController extends GetxController {
  static CustomerProfileController get instance => Get.find();

  final AppUserRepository userRepository = AppUserRepository.instance;
  final AuthRepository authRepo = AuthRepository.instance;
  final GlobalKey<FormState> userEditFormKey = GlobalKey<FormState>();
  late final TextEditingController fNameCon;
  late final TextEditingController lNameCon;
  late final TextEditingController emailCon;
  Rx<String> selectedUserDob = "".obs;

  Rx<AppUser> currentAppUser = AppUser.empty().obs;
  RxBool isUserStillLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameCon = TextEditingController();
    lNameCon = TextEditingController();
    emailCon = TextEditingController();
    _fetchAppUser();
  }

  Future<void> selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1940),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );

    if (selectedDate != null) {
      selectedUserDob.value = AppDateFormater.formatDate(date: selectedDate);
    }
  }

  void resetResources() {
    userEditFormKey.currentState?.reset();
    fNameCon.clear();
    lNameCon.clear();
    emailCon.clear();
  }

  Future<void> _fetchAppUser() async {
    try {
      isUserStillLoading.value = true;
      final receivedUser =
          await userRepository.fetchUserDetails(uid: authRepo.currentUser!.uid);

      isUserStillLoading.value = false;
      currentAppUser.value = receivedUser;
      selectedUserDob.value =
          AppDateFormater.formatDate(date: receivedUser.dob);
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Error fetching user",
      );
    }
  }

  void editUserProfile() async {
    try {
      AppLoaderService.startLoader(loaderText: "Updating user details");

      final bool isFormValid = userEditFormKey.currentState!.validate();
      if (!isFormValid) {
        AppLoaderService.stopLoader();
        return;
      }

      final editedUser = AppUser(
        uid: currentAppUser.value.uid,
        userType: currentAppUser.value.userType,
        emailAddress: emailCon.text.isNotEmpty
            ? emailCon.text.trim()
            : currentAppUser.value.emailAddress,
        firstName: fNameCon.text.isNotEmpty
            ? fNameCon.text.trim()
            : currentAppUser.value.firstName,
        lastName: lNameCon.text.isNotEmpty
            ? lNameCon.text.trim()
            : currentAppUser.value.lastName,
        phoneNumber: currentAppUser.value.phoneNumber,
        dob: AppDateFormater.convertToDate(selectedUserDob.value) ??
            currentAppUser.value.dob,
      );

      await userRepository.updateUserRecord(editedUser);
      resetResources();
      final updatedUser =
          await userRepository.fetchUserDetails(uid: currentAppUser.value.uid);
      currentAppUser.value = updatedUser;
      currentAppUser.refresh();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Successful",
        message: "user info updated!",
      );
      AppNagivator.goBack();
    } catch (e) {
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "info not updated",
      );
    }
  }
}
