import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/payment_details_repo/payment_details_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/api_services/nigeria_banks_api_service.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';

import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../setup/app_navigator.dart';
import '../model/payment_details_model.dart';

class PaymentDetailsController extends GetxController {
  static PaymentDetailsController get instance => Get.find();
  final NigeriaBanksApiService bankService = NigeriaBanksApiService();
  final PaymentDetailsRepository paymentDetailsRepository =
      Get.put(PaymentDetailsRepository());
  final GlobalKey<FormState> accountDetailsFormKey = GlobalKey<FormState>();
  String? currentUserId = AuthRepository.instance.currentUser?.uid;
  late final TextEditingController accountNumberCon;
  late final TextEditingController accountNameCon;
  RxString selectedBankName = "".obs;
  RxList<String> allBanks = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchBanks();

    accountNameCon = TextEditingController();
    accountNumberCon = TextEditingController();
  }

  @override
  void onClose() {
    accountNameCon.dispose();
    accountNumberCon.dispose();
    super.onClose();
  }

  void _fetchBanks() async {
    try {
      final receivedBanks = await bankService.getAllSupportedNigeriaBanks();
      final banks = receivedBanks.map((bank) => bank.name).toList();
      allBanks.assignAll(banks);
      selectedBankName.value = banks.first;
    } catch (e) {
      AppDebugger.debugger(e);
    }
  }

  void onBankSelected(String? newBank) {
    if (newBank != null) {
      selectedBankName.value = newBank;
    }
  }

  void onSaveAccountDetails() async {
    try {
      AppLoaderService.startLoader(
          loaderText: "Saving account details, please wait...");

      if (!(accountDetailsFormKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        AlertServices.errorSnackBar(
            title: "Oh snap!", message: "Please fill all fields");
        return;
      }

      if (currentUserId == null) {
        AppLoaderService.stopLoader();
        AlertServices.errorSnackBar(
            title: "Oh snap!", message: "User not found");
        return;
      }

      if (selectedBankName.value.isEmpty) {
        AppLoaderService.stopLoader();
        AlertServices.errorSnackBar(
            title: "Oh snap!", message: "Please select a bank");
        return;
      }
      await _saveAccountDetails();

      //reset form
      _resetForm();

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
          title: "Success", message: "Account details saved successfully");
      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
          title: "Oh snap!", message: "Form submission failed");
    }
  }

  Future<void> _saveAccountDetails() async {
    try {
      final PaymentDetailsModel newPaymentDetails = PaymentDetailsModel(
        hostUserId: currentUserId!,
        bankName: selectedBankName.value,
        accountNumber: accountNumberCon.text.trim(),
        accountName: accountNameCon.text.trim(),
        isAccountActive: true,
      );

      // Save account details
      await paymentDetailsRepository.createNewPaymentDetails(
        paymentDetails: newPaymentDetails,
      );
    } catch (e) {
      rethrow;
    }
  }

  void _resetForm() {
    selectedBankName.value = allBanks.first;
    accountNumberCon.clear();
    accountNameCon.clear();
    accountDetailsFormKey.currentState?.reset();
  }
}
