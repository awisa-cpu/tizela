import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:tizela/data/repositories/auth_repository/auth_repository.dart";
import "package:tizela/data/repositories/boat_cruise_repository/boat_cruise_repository.dart";
import "package:tizela/data/services/alert_services.dart";
import "package:tizela/data/services/app_loader_services.dart";
import "package:tizela/data/services/network_service.dart";
import "package:tizela/features/menu/host_menu/listings/model/app_file_model.dart";
import "package:tizela/setup/app_navigator.dart";
import "package:tizela/utils/device/app_debugger/app_debugger.dart";

import "../../../../../data/local_database.dart";
import "../../../../../utils/device/app_functions.dart/app_functions.dart";
import "../model/boat_cruise_model.dart";
import "../model/boat_type_model.dart";

class EditHostBoatCruiseController extends GetxController {
  static EditHostBoatCruiseController get instance => Get.find();

  ///variables
  final BoatCruiseRepository boatCruiseRepo = BoatCruiseRepository.instance;
  final String? currentUserId = AuthRepository.instance.currentUser?.uid;
  late final TextEditingController editBoatFeeController;
  late final TextEditingController editBoatNameController;
  late final TextEditingController editBoatDescriptionController;
  late final TextEditingController addressStreetNameCon;
  late final TextEditingController addressHouseNumberCon;
  late final TextEditingController addressPostalCodeCon;
  final GlobalKey<FormState> editBoatKey = GlobalKey<FormState>();
  final GlobalKey<FormState> editBoatNameKey = GlobalKey<FormState>();
  RxBool isTizelaTandCAccepted = false.obs;
  RxBool isBoatNameUpdating = false.obs;
  RxBool isBoatImagesUpdating = false.obs;
  RxBool isBoatAvailabilityUpdating = false.obs;
  RxBool isBoatDetailsUpdating = false.obs;
  RxBool isBoatFeatureAmenityUpdating = false.obs;
  RxBool isBoatSafetyFeatureUpdating = false.obs;
  RxBool isBoatSpecialAmenityUpdating = false.obs;
  RxBool isBoatPoliciesUpdating = false.obs;
  RxBool isBoatSailorPoliciesUpdating = false.obs;
  RxBool isBoatTypeAndDescriptionUpdating = false.obs;
  RxBool isBoatAddressUpdating = false.obs;
  double boatFee = 0.0;
  RxList<AppFileModel> selectedImages = <AppFileModel>[].obs;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  final boatTypes = LocalDatabase.boatTypes;
  Rx<BoatTypeModel> selectedBoatType = BoatTypeModel.empty().obs;
  RxString currentStateValue = "Select a state".obs;
  RxString currentStateLga = "Select your lga".obs;

  ///methods

  @override
  void onInit() {
    super.onInit();
    editBoatFeeController = TextEditingController();
    editBoatNameController = TextEditingController();
    editBoatDescriptionController = TextEditingController();
    addressStreetNameCon = TextEditingController();
    addressHouseNumberCon = TextEditingController();
    addressPostalCodeCon = TextEditingController();
  }

  @override
  void dispose() {
    editBoatFeeController.dispose();
    editBoatNameController.dispose();
    editBoatDescriptionController.dispose();
    addressStreetNameCon.dispose();
    addressHouseNumberCon.dispose();
    addressPostalCodeCon.dispose();
    super.dispose();
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee =
        AppFunctions.getPriceFromController(editBoatFeeController);
    double finalPrice = 0.0;

    if (apartmentFee != 0.0) {
      finalPrice = apartmentFee;
    }

    double serviceCharge = finalPrice * 12.5 / 100;
    final boatPrice = finalPrice - serviceCharge;
    boatFee = boatPrice;
    return boatPrice.toStringAsFixed(2);
  }

  void updateBoatCruisePrice(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      AppLoaderService.startLoader(
        loaderText: "Updating boat fee, please wait...",
      );

      if (!(editBoatKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      if (isTizelaTandCAccepted.value == false) {
        AppLoaderService.stopLoader();
        AlertServices.warningSnackBar(
          title: "T and C ",
          message: "Accept terms and conditions",
        );
        return;
      }

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatFee: boatFee != 0.0 ? boatFee : currentBoatCruise.boatFee,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Boat price updated",
      );
      AppNagivator.goBack();
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Boat price not  updated",
      );
    } finally {
      editBoatFeeController.clear();
      editBoatKey.currentState?.reset();
      boatFee = 0.0;
    }
  }

  void updateBoatCruiseName(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      if (!(editBoatNameKey.currentState?.validate() ?? false)) {
        return;
      }
      isBoatNameUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        name: editBoatNameController.text.trim(),
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Name updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: 'Oh snap!',
        message: "Name not updated",
      );
    } finally {
      editBoatNameController.clear();
      editBoatNameKey.currentState?.reset();
      isBoatNameUpdating.value = false;
    }
  }

  void updateBoatCruiseImages(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      if (selectedImages.isEmpty) {
        AlertServices.warningSnackBar(
          title: 'warining',
          message: "You should select at least an image",
        );
        return;
      }

      if (currentUserId == null) {
        return;
      }
      isBoatImagesUpdating.value = true;

      final uploadedImages = await AppFunctions.uploadSelectedImagesToCloud(
        uid: currentUserId!,
        selectedImages: selectedImages,
      );

      await boatCruiseRepo.editSpecificBoatCruiseDetails(
        boatCruiseId: currentBoatCruise.uid!,
        data: {
          "boatImages": FieldValue.arrayUnion(uploadedImages),
        },
      );

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Boat images updated succeefully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: 'Oh snap!',
        message: "boat images not updated",
      );
    } finally {
      selectedImages.clear();
      isBoatImagesUpdating.value = false;
    }
  }

  void updateBoatCruiseAvailability(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      final firstDate = currentBoatCruise.availableDates[0];
      final secondDate = currentBoatCruise.availableDates[1];

      if (firstDate == dateInFocusedDay.value &&
          secondDate == dateOutFocusedDay.value) {
        return;
      }

      isBoatAvailabilityUpdating.value = true;

      //
      final updateBoatCruise = currentBoatCruise.copyWith(
        availableDates: [dateInFocusedDay.value, dateOutFocusedDay.value],
      );

      //
      await boatCruiseRepo.editBoatCruise(boatCruise: updateBoatCruise);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Availability updated succeefully",
      );

      //
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "Availability not updated",
      );
    } finally {
      dateInFocusedDay.value = DateTime.now();
      dateOutFocusedDay.value = DateTime.now();
      isBoatAvailabilityUpdating.value = false;
    }
  }

  void updateBoatCruiseDetails(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatDetailsUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatCruiseDetails: currentBoatCruise.boatCruiseDetails,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Boat details updated succeefully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "details not updated",
      );
    } finally {
      isBoatDetailsUpdating.value = false;
    }
  }

  void updateBoatCruiseFeatureAme(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatFeatureAmenityUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatAmenities: currentBoatCruise.boatAmenities,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Features updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "features not updated",
      );
    } finally {
      isBoatFeatureAmenityUpdating.value = false;
    }
  }

  void updateBoatCruiseSafetyFeature(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatSafetyFeatureUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatSafetyFeatures: currentBoatCruise.boatSafetyFeatures,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Safety features updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "safety features not updated",
      );
    } finally {
      isBoatSafetyFeatureUpdating.value = false;
    }
  }

  void updateBoatCruiseSpecialAmenity(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatSpecialAmenityUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatCruiseSpecialtyAmenities:
            currentBoatCruise.boatCruiseSpecialtyAmenities,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Special amenities updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "special amenities not updated",
      );
    } finally {
      isBoatSpecialAmenityUpdating.value = false;
    }
  }

  void updateBoatCruiseBoatPolicies(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatPoliciesUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatPolicies: currentBoatCruise.boatPolicies,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Boat policies updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "Boat policies not updated",
      );
    } finally {
      isBoatPoliciesUpdating.value = false;
    }
  }

  void updateBoatCruiseSailorPolicies(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      isBoatSailorPoliciesUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatSailorPolicies: currentBoatCruise.boatSailorPolicies,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Sailor policies updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "Sailor policies not updated",
      );
    } finally {
      isBoatSailorPoliciesUpdating.value = false;
    }
  }

  void updateBoatCruiseTypeAndDescription(
      {required BoatCruiseModel currentBoatCruise}) async {
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
      if (editBoatDescriptionController.text.isEmpty &&
          selectedBoatType.value.boatName.isEmpty) {
        return;
      }
      isBoatTypeAndDescriptionUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        boatStory: editBoatDescriptionController.text.isNotEmpty
            ? editBoatDescriptionController.text
            : currentBoatCruise.boatStory,
        boatType: selectedBoatType.value.boatName.isNotEmpty
            ? selectedBoatType.value
            : currentBoatCruise.boatType,
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: 'Good!',
        message: "Boat  type/description updated successfully",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: 'Oh snap!',
        message: "Boat  type/description not updated",
      );
    } finally {
      editBoatDescriptionController.clear();
      selectedBoatType.value = BoatTypeModel.empty();
      isBoatTypeAndDescriptionUpdating.value = false;
    }
  }

  void updateBoatCruiseAddress({required BoatCruiseModel boatCruise}) async {
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
          currentStateLga.value == "Select your lga") {
        return;
      }

      isBoatAddressUpdating.value = true;

      //
      final updatedAddress = boatCruise.address.copyWith(
        houseNumber: addressHouseNumberCon.text.isNotEmpty
            ? addressHouseNumberCon.text.trim()
            : boatCruise.address.houseNumber,
        streetName: addressStreetNameCon.text.isNotEmpty
            ? addressStreetNameCon.text.trim()
            : boatCruise.address.streetName,
        postalCode: addressPostalCodeCon.text.isNotEmpty
            ? addressPostalCodeCon.text.trim()
            : boatCruise.address.postalCode,
        lga: currentStateLga.value != "Select a lga"
            ? currentStateLga.value
            : boatCruise.address.lga,
        state: currentStateValue.value != "Select a state"
            ? currentStateValue.value
            : boatCruise.address.state,
      );
      final updatedBoatCruise = boatCruise.copyWith(address: updatedAddress);

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);

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
      isBoatAddressUpdating.value = false;
    }
  }
}
