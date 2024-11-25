import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/shortlet_repository/shorlet_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/data/services/media_service.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';
import 'package:tizela/utils/device/app_device_services/app_device_services.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';
import '../../../../../data/local_database.dart';
import '../../../customer_menu/home/model/apartment_type_model.dart';
import '../model/shorlet_model.dart';

class EditHostShortletController extends GetxController {
  static EditHostShortletController get instance => Get.find();

  final ShorletRepository shortletRepo = ShorletRepository.instance;
  final MediaServiceController mediaService = MediaServiceController.instance;
  final GlobalKey<FormState> apartmentPriceKey = GlobalKey<FormState>();
  final GlobalKey<FormState> apartmentNameKey = GlobalKey<FormState>();
  late final TextEditingController apartmentPrice;
  late final TextEditingController cautionPrice;
  late final TextEditingController shorletNameCon;
  late final TextEditingController shorletAnyStoryCon;
  double shortletFee = 0.0;
  RxBool isTermsAccepted = false.obs;
  RxBool areImagesUpdating = false.obs;
  RxBool isApartmentTypeUpdating = false.obs;
  RxBool isShorletStoryUpdating = false.obs;
  RxList<AppFileModel> selectedImages = <AppFileModel>[].obs;
  Rx<ApartmentTypeModel> selectedApartment = ApartmentTypeModel.empty().obs;
  final apartmentTypes = LocalDatabase.apartmentTypes;

  @override
  void onInit() {
    super.onInit();
    apartmentPrice = TextEditingController();
    cautionPrice = TextEditingController();
    shorletNameCon = TextEditingController();
    shorletAnyStoryCon = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    apartmentPrice.dispose();
    cautionPrice.dispose();
    shorletNameCon.dispose();
    shorletAnyStoryCon.dispose();
  }

  void _resetResources() {
    apartmentPrice.clear();
    cautionPrice.clear();
    shorletNameCon.clear();
    apartmentPriceKey.currentState?.reset();
    apartmentNameKey.currentState?.reset();
    selectedImages.value = [];
    selectedApartment.value = ApartmentTypeModel.empty();
    shorletAnyStoryCon.clear();
  }

  void updateTizelaTerms(bool? value) {
    if (value != null) {
      isTermsAccepted.value = value;
    }
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee = double.tryParse(apartmentPrice.text.trim());
    double finalPrice = 0.0;
    if (apartmentFee != null) {
      finalPrice = apartmentFee;
    }
    double serviceCharge = finalPrice * 12.5 / 100;
    final shortletPrice = finalPrice - serviceCharge;
    shortletFee = shortletPrice;
    return shortletPrice.toStringAsFixed(2);
  }

  void updateShorletPrice(ShortletModel shortlet) async {
    try {
      AppLoaderService.startLoader(loaderText: "Editing price...");

      if (!(apartmentPriceKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      final updatedCopy = shortlet.copyWith(
        apartmentPrice: shortletFee,
        cautionFee: AppFunctions.getPriceFromController(cautionPrice),
      );

      //
      await shortletRepo.editShorlet(shorlet: updatedCopy);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good",
        message: "shortlet price updated",
      );
      AppNagivator.goBack(Get.context!);
      //note: once line 82 is executed, the view that injects the dependency gets disposed of the nav stack and so is the controller
    } catch (e) {
      AppLoaderService.stopLoader();
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Something went wrong editing price",
      );
    }
  }

  void updateShortletName({required ShortletModel shorlet}) async {
    try {
      if (!(apartmentNameKey.currentState?.validate() ?? false)) {
        return;
      }
      //
      final updatedShortlet = shorlet.copyWith(
        apartmentName: shorletNameCon.text.trim(),
      );

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "apartment name updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "apartment name not updated",
      );
    }
  }

  void selectImages() async {
    try {
      final imageFile = await mediaService.pickImageFromGallery();
      if (imageFile != null) {
        final fileName = AppDeviceServices.getImageName(imageFile: imageFile);
        final AppFileModel file = AppFileModel(file: imageFile, name: fileName);
        if (!selectedImages.contains(file)) {
          selectedImages.add(file);
        }
      }
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "Try again",
      );
    }
  }

  void deleteImageFileFromSelectedImages({
    required List<AppFileModel> selectedImages,
    required AppFileModel imageFile,
  }) =>
      selectedImages.remove(imageFile);

  void updateShortletImages({required ShortletModel shortlet}) async {
    try {
      //check
      if (selectedImages.isEmpty) {
        AlertServices.warningSnackBar(
            title: "warning", message: "You should select at least an image");
        return;
      }
      areImagesUpdating.value = true;
      //
      List<String> uploadedImages =
          await _uploadSelectedImagesToCloud(shortlet);

      await shortletRepo.editSpecificShorletDetails(
        shorletId: shortlet.uid!,
        data: {
          "apartmentImages": FieldValue.arrayUnion(uploadedImages),
        },
      );
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "shorlet images updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "images not updated",
      );
    } finally {
      areImagesUpdating.value = false;
    }
  }

  Future<List<String>> _uploadSelectedImagesToCloud(
      ShortletModel shortlet) async {
    List<File> images = selectedImages.map((file) => file.file).toList();
    List<String> uploadedImages = [];

    //
    for (final imageFile in images) {
      final String? downloadUrl = await mediaService.uploadImageTo(
        currentUid: shortlet.userId,
        imageFile: imageFile,
      );

      if (downloadUrl != null) {
        uploadedImages.add(downloadUrl);
      }
    }
    return uploadedImages;
  }

  void onSelectedApartmentUpdate(ApartmentTypeModel apartmentType) =>
      selectedApartment.value = apartmentType;
  void updateApartmentType({required ShortletModel shortlet}) async {
    try {
      //todo: work on this check mechanism
      if (selectedApartment.value == ApartmentTypeModel.empty()) {
        AlertServices.warningSnackBar(
          title: "Warning!",
          message: "Select an apartment type",
        );
        return;
      }
      isApartmentTypeUpdating.value = true;

      //
      final updatedShorlet = shortlet.copyWith(
        apartmentType: selectedApartment.value,
      );

      await shortletRepo.editShorlet(shorlet: updatedShorlet);
      selectedApartment.value = ApartmentTypeModel.empty();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Apartment type updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "Apartment type not updated",
      );
    } finally {
      isApartmentTypeUpdating.value = false;
    }
  }

  void updateShortletStory({required ShortletModel shortlet}) async {
    try {
      if (shorletAnyStoryCon.text.isEmpty) {
        return;
      }
      isShorletStoryUpdating.value = true;

      await shortletRepo.editSpecificShorletDetails(
        shorletId: shortlet.uid!,
        data: {"anyStory": shorletAnyStoryCon.text.trim()},
      );
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Shortlet story updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "Shorlet story not updated",
      );
    } finally {
      isShorletStoryUpdating.value = false;
    }
  }
}
