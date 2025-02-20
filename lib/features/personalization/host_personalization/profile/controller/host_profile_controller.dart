import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/network_service.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/formatters/app_date_formatter.dart';
import '../../../../auth/models/app_user.dart';

class HostProfileController extends GetxController {
  static HostProfileController get instance => Get.find();

  final AuthRepository authRepo = AuthRepository.instance;
  final NetworkServiceController networkController =
      NetworkServiceController.instance;
  final AppUserRepository hostRepository = AppUserRepository.instance;

  final GlobalKey<FormState> hostEditFormKey = GlobalKey<FormState>();
  late final TextEditingController fNameCon;
  late final TextEditingController lNameCon;
  late final TextEditingController emailCon;
  late final TextEditingController phoneNumberCon;
  Rx<String> selectedUserDob = "".obs;

  Rx<AppUser> currentAppUser = AppUser.empty().obs;
  RxBool isUserStillLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fNameCon = TextEditingController();
    lNameCon = TextEditingController();
    emailCon = TextEditingController();
    phoneNumberCon = TextEditingController();
    _fetchAppUser();
  }

  void resetResources() {
    hostEditFormKey.currentState?.reset();
    fNameCon.clear();
    lNameCon.clear();
    emailCon.clear();
    phoneNumberCon.clear();
  }

  Future<void> _fetchAppUser() async {
    try {
      isUserStillLoading.value = true;
      final receivedUser =
          await hostRepository.fetchUserDetails(uid: authRepo.currentUser!.uid);

      isUserStillLoading.value = false;
      currentAppUser.value = receivedUser;
      selectedUserDob.value =
          AppDateFormater.formatDate(date: receivedUser.dob);
    } catch (e) {
      isUserStillLoading.value = false;
      AppDebugger.debugger(e.toString());
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Error fetching user",
      );
    }
  }

  void editHostProfile() async {
    try {
      AppLoaderService.startLoader(
          loaderText: "Updating host details, please wait...");

      //make some checks
      if (authRepo.currentUser == null) {
        AppLoaderService.stopLoader();
        return;
      }

      //
      if (fNameCon.text.isEmpty &&
          lNameCon.text.isEmpty &&
          phoneNumberCon.text.isEmpty &&
          emailCon.text.isEmpty) {
        AppLoaderService.stopLoader();
        return;
      }

      await _updateHostUserRecord();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Successful",
        message: "host info updated!",
      );
      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      resetResources();
      AlertServices.errorSnackBar(
          title: "Oh snap", message: "Profile details not updated, try again");
    }
  }

  Future<void> _updateHostUserRecord() async {
    try {
      await hostRepository.updateSpecificUserData(
        uid: authRepo.currentUser!.uid,
        data: {
          "firstName": fNameCon.text.isNotEmpty
              ? fNameCon.text.trim()
              : currentAppUser.value.firstName,
          "lastName": lNameCon.text.isNotEmpty
              ? lNameCon.text.trim()
              : currentAppUser.value.lastName,
          "phoneNumber": phoneNumberCon.text.isNotEmpty
              ? phoneNumberCon.text.trim()
              : currentAppUser.value.phoneNumber,
          "emailAddress": emailCon.text.isNotEmpty
              ? emailCon.text.trim()
              : currentAppUser.value.emailAddress,
        },
      );
      resetResources();
      final updatedUser =
          await hostRepository.fetchUserDetails(uid: currentAppUser.value.uid);
      currentAppUser.value = updatedUser;
      currentAppUser.refresh();
    } catch (e) {
      rethrow;
    }
  }
}
