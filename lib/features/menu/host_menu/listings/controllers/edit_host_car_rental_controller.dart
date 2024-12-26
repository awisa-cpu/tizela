import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/car_rental_repository/car_rental_repository.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/data/services/network_service.dart';

import '../../../../../data/local_database.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../model/app_file_model.dart';
import '../model/car_brand_model.dart';
import '../model/car_rental_model.dart';

class EditHostCarRentalController extends GetxController {
  static EditHostCarRentalController get instance => Get.find();

  ///variables
  final CarRentalRepository carRentalRepo = CarRentalRepository.instance;
  late final TextEditingController carRentalPriceCon;
  late final TextEditingController carRentalNameCon;
  late final TextEditingController addressStreetNameCon;
  late final TextEditingController addressHouseNumberCon;
  late final TextEditingController addressPostalCodeCon;
  final GlobalKey<FormState> carRentalPriceKey = GlobalKey<FormState>();
  RxBool isTizelaTandCAccepted = false.obs;
  RxBool isCarRentalNameUpdating = false.obs;
  RxBool isCarRentalPhotosUpdating = false.obs;
  RxBool isCarRentalTypeAndDetailsUpdating = false.obs;
  RxBool isCarRentalDatesUpdating = false.obs;
  RxBool isCarRentalDetailsUpdating = false.obs;
  RxBool isCarRentalFeaturesUpdating = false.obs;
  RxBool isCarRentalSafetyFeaturesUpdating = false.obs;
  RxBool isCarRentalPoliciesUpdating = false.obs;
  RxBool isCarRentalAddressUpdating = false.obs;
  RxBool isCarRentalDriverPoliciesUpdating = false.obs;
  double carRentalFee = 0.0;
  final RxList<AppFileModel> selectedImages = <AppFileModel>[].obs;
  List<String> carTypes = LocalDatabase.carTypeName;
  RxString selectedCarType = "".obs;
  List<CarBrandModel> carModels = LocalDatabase.carBrandModels;
  Rx<CarBrandModel> selectedCarBrand = CarBrandModel.empty().obs;
  RxString selectedCarYear = "Car Year".obs;
  RxString currentStateValue = "Select a state".obs;
  RxString currentStateLga = "Select your lga".obs;
  Rx<DateTime> dateInSelected = DateTime.now().obs;
  Rx<DateTime> dateOutSelected = DateTime.now().obs;
  RxBool isIntraStateMovement = false.obs;
  RxBool isInterStateMovement = false.obs;
  RxBool isCarMovementOutsideState = false.obs;

  ///methods

  @override
  void onInit() {
    super.onInit();
    carRentalPriceCon = TextEditingController();
    carRentalNameCon = TextEditingController();
    addressStreetNameCon = TextEditingController();
    addressHouseNumberCon = TextEditingController();
    addressPostalCodeCon = TextEditingController();
  }

  @override
  void dispose() {
    carRentalPriceCon.dispose();
    carRentalNameCon.dispose();
    addressStreetNameCon.dispose();
    addressHouseNumberCon.dispose();
    addressPostalCodeCon.dispose();
    super.dispose();
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee = AppFunctions.getPriceFromController(carRentalPriceCon);
    double finalPrice = 0.0;

    if (apartmentFee != 0.0) {
      finalPrice = apartmentFee;
    }

    double serviceCharge = finalPrice * (12.5 / 100);
    double boatPrice = finalPrice - serviceCharge;
    carRentalFee = boatPrice;
    return boatPrice.toStringAsFixed(2);
  }

  void updateCarRentalPrice({required CarRentalModel carRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      AppLoaderService.startLoader(
        loaderText: "Updating price, please wait...",
      );

      if (!(carRentalPriceKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      if (isTizelaTandCAccepted.value != true) {
        AppLoaderService.stopLoader();
        AlertServices.warningSnackBar(
          title: "warning",
          message: "You must accept terms and conditions",
        );
        return;
      }

      final updatedCarRental = carRental.copyWith(carPrice: carRentalFee);

      await carRentalRepo.editCarRental(carRental: updatedCarRental);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Congrats",
        message: "Price successfully updated!",
      );
      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Price not updated!",
      );
    } finally {
      carRentalPriceKey.currentState?.reset();
      carRentalPriceCon.clear();
      isTizelaTandCAccepted.value = false;
    }
  }

  void updateCarRentalName({required CarRentalModel carRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      if (carRentalNameCon.text.isEmpty) {
        return;
      }

      //
      isCarRentalNameUpdating.value = true;
      final updatedCarRental = carRental.copyWith(
        carName: carRentalNameCon.text.trim(),
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good",
        message: "car name updated!",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "car name  not updated",
      );
    } finally {
      carRentalNameCon.clear();
      isCarRentalNameUpdating.value = false;
    }
  }

  void updateCarRentalPhotos({required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //

      if (selectedImages.isEmpty) {
        AlertServices.warningSnackBar(
          title: "warning",
          message: "You should select at least an image",
        );
        return;
      }
      //
      isCarRentalPhotosUpdating.value = true;

      //
      final uploadedImages = await AppFunctions.uploadSelectedImagesToCloud(
        uid: currentCarRental.userId,
        selectedImages: selectedImages,
      );

      await carRentalRepo.editSpecificCarRentalDetails(
        carRentalId: currentCarRental.uid!,
        data: {"carImages": FieldValue.arrayUnion(uploadedImages)},
      );

      //
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Car images updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Car images not updated",
      );
    } finally {
      //
      selectedImages.clear();
      isCarRentalPhotosUpdating.value = false;
    }
  }

  void updateCarRentalTypeAndModelDetails(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      if (selectedCarType.value.isEmpty &&
          selectedCarYear.value.isEmpty &&
          selectedCarBrand.value.id.isEmpty) {
        return;
      }
      isCarRentalTypeAndDetailsUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        carType: selectedCarType.value.isEmpty
            ? currentCarRental.carType
            : selectedCarType.value,
        carBrand: selectedCarBrand.value.id.isEmpty
            ? currentCarRental.carBrand
            : selectedCarBrand.value,
        carYear: selectedCarYear.value.isEmpty
            ? currentCarRental.carYear
            : selectedCarYear.value,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Car details updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Car details not updated",
      );
    } finally {
      selectedCarType.value = "";
      selectedCarBrand.value = CarBrandModel.empty();
      selectedCarYear.value = "";
      isCarRentalTypeAndDetailsUpdating.value = false;
    }
  }

  void updateCarRentalDateSelected(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      final firstDate = currentCarRental.availableDates[0];
      final secondDate = currentCarRental.availableDates[1];

      if (firstDate == dateInSelected.value &&
          secondDate == dateOutSelected.value) {
        return;
      }
      isCarRentalDatesUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
          availableDates: [dateInSelected.value, dateOutSelected.value]);
      await carRentalRepo.editCarRental(carRental: updatedCarRental);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Availability  updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Availability not updated",
      );
    } finally {
      dateInSelected.value = DateTime.now();
      dateOutSelected.value = DateTime.now();
      isCarRentalDatesUpdating.value = false;
    }
  }

  void updateCarRentalDetails(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      isCarRentalDetailsUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        carRentalDetails: currentCarRental.carRentalDetails,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Car details updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Car details not updated",
      );
    } finally {
      isCarRentalDetailsUpdating.value = false;
    }
  }

  void updateCarRentalFeatures(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      isCarRentalFeaturesUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        carRentalFeatures: currentCarRental.carRentalFeatures,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Car feaures updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Car features not updated",
      );
    } finally {
      isCarRentalFeaturesUpdating.value = false;
    }
  }

  void updateCarRentalSafetyFeatures(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      isCarRentalSafetyFeaturesUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        safetyFeatures: currentCarRental.safetyFeatures,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Safety feaures updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Safety features not updated",
      );
    } finally {
      isCarRentalSafetyFeaturesUpdating.value = false;
    }
  }

  void updateCarRentalPolicy({required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }

      //
      isCarRentalPoliciesUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        carPolicies: currentCarRental.carPolicies,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Car policies updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Car policies not updated",
      );
    } finally {
      isCarRentalPoliciesUpdating.value = false;
    }
  }

  void updateCarRentalDriverPolicy(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }
      isCarRentalDriverPoliciesUpdating.value = true;

      final updatedCarRental = currentCarRental.copyWith(
        driverPolicies: currentCarRental.driverPolicies,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Driver's policies updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Driver's policies not updated",
      );
    } finally {
      isCarRentalDriverPoliciesUpdating.value = false;
    }
  }

  void updateCarRentalAddress(
      {required CarRentalModel currentCarRental}) async {
    try {
      //check for network connection
      final isConnected =
          await NetworkServiceController.instance.isInternetConnected();

      if (!isConnected) {
        AlertServices.errorSnackBar(
          title: "Oh snap!",
          message: "No internet",
        );
        return;
      }
      if (addressStreetNameCon.text.isEmpty &&
          addressHouseNumberCon.text.isEmpty &&
          addressPostalCodeCon.text.isEmpty &&
          currentStateValue.value == "Select a state" &&
          currentStateLga.value == "Select your lga" &&
          isInterStateMovement.value == false &&
          isIntraStateMovement.value == false) {
        return;
      }

      isCarRentalAddressUpdating.value = true;

      //
      final updatedAddress = currentCarRental.address.copyWith(
        houseNumber: addressHouseNumberCon.text.isNotEmpty
            ? addressHouseNumberCon.text.trim()
            : currentCarRental.address.houseNumber,
        streetName: addressStreetNameCon.text.isNotEmpty
            ? addressStreetNameCon.text.trim()
            : currentCarRental.address.streetName,
        postalCode: addressPostalCodeCon.text.isNotEmpty
            ? addressPostalCodeCon.text.trim()
            : currentCarRental.address.postalCode,
        lga: currentStateLga.value != "Select a lga"
            ? currentStateLga.value
            : currentCarRental.address.lga,
        state: currentStateValue.value != "Select a state"
            ? currentStateValue.value
            : currentCarRental.address.state,
      );
      final updatedCarRental = currentCarRental.copyWith(
        address: updatedAddress,
        isCarMovementOutsideState: isCarMovementOutsideState.value,
      );

      await carRentalRepo.editCarRental(carRental: updatedCarRental);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Address updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Address not updated",
      );
    } finally {
      addressStreetNameCon.clear();
      addressHouseNumberCon.clear();
      addressPostalCodeCon.clear();
      currentStateLga.value = "Select a lga";
      currentStateValue.value = "Select a state";
      isCarMovementOutsideState.value = false;
      isIntraStateMovement.value = false;
      isInterStateMovement.value = false;
      isCarRentalAddressUpdating.value = false;
    }
  }
}
