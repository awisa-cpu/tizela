import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:tizela/data/repositories/auth_repository/auth_repository.dart";
import "package:tizela/data/repositories/boat_cruise_repository/boat_cruise_repository.dart";
import "package:tizela/data/services/alert_services.dart";
import "package:tizela/data/services/app_loader_services.dart";
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
  double boatFee = 0.0;
  RxList<AppFileModel> selectedImages = <AppFileModel>[].obs;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  final boatTypes = LocalDatabase.boatTypes;
  Rx<BoatTypeModel> selectedBoatType = BoatTypeModel.empty().obs;

  ///methods

  @override
  void onInit() {
    super.onInit();
    editBoatFeeController = TextEditingController();
    editBoatNameController = TextEditingController();
    editBoatDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    editBoatFeeController.dispose();
    editBoatNameController.dispose();
    editBoatDescriptionController.dispose();
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
      editBoatFeeController.clear();
      editBoatKey.currentState?.reset();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Boat price updated",
      );
      AppNagivator.goBack(Get.context!);
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Boat price not  updated",
      );
    }
  }

  void updateBoatCruiseName(
      {required BoatCruiseModel currentBoatCruise}) async {
    try {
      if (!(editBoatNameKey.currentState?.validate() ?? false)) {
        return;
      }
      isBoatNameUpdating.value = true;

      final updatedBoatCruise = currentBoatCruise.copyWith(
        name: editBoatNameController.text.trim(),
      );

      await boatCruiseRepo.editBoatCruise(boatCruise: updatedBoatCruise);
      editBoatNameController.clear();
      editBoatNameKey.currentState?.reset();
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
      isBoatNameUpdating.value = false;
    }
  }

  void updateBoatCruiseImages(
      {required BoatCruiseModel currentBoatCruise}) async {
    try {
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
      selectedImages.clear();
      editBoatNameController.dispose();
      editBoatNameKey.currentState?.reset();
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
      isBoatImagesUpdating.value = false;
    }
  }

  void updateBoatCruiseAvailability(
      {required BoatCruiseModel currentBoatCruise}) async {
    try {
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
      dateInFocusedDay.value = DateTime.now();
      dateOutFocusedDay.value = DateTime.now();
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
      isBoatAvailabilityUpdating.value = false;
    }
  }

  void updateBoatCruiseDetails(
      {required BoatCruiseModel currentBoatCruise}) async {
    try {
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
      isBoatTypeAndDescriptionUpdating.value = false;
    }
  }
}
