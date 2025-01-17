import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/shortlet_repository/shortlet_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/data/services/media_service.dart';
import 'package:tizela/data/services/network_service.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/device/app_debugger/app_debugger.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';
import '../../../../../data/local_database.dart';
import '../../../customer_menu/home/model/apartment_type_model.dart';
import '../model/shortlet_model.dart';

class EditHostShortletController extends GetxController {
  static EditHostShortletController get instance => Get.find();

  final ShortletRepository shortletRepo = ShortletRepository.instance;
  final MediaServiceController mediaService = MediaServiceController.instance;
  final GlobalKey<FormState> apartmentPriceKey = GlobalKey<FormState>();
  final GlobalKey<FormState> apartmentNameKey = GlobalKey<FormState>();
  late final TextEditingController apartmentPrice;
  late final TextEditingController cautionPriceCon;
  late final TextEditingController shorletNameCon;
  late final TextEditingController shorletAnyStoryCon;
  late final TextEditingController shorletApartmentPriceCon;
  late final TextEditingController addressStreetNameCon;
  late final TextEditingController addressHouseNumberCon;
  late final TextEditingController addressPostalCodeCon;
  double shortletFee = 0.0;
  RxBool isTermsAccepted = false.obs;
  RxBool isShorletNameUpdating = false.obs;
  RxBool areImagesUpdating = false.obs;
  RxBool isApartmentTypeUpdating = false.obs;
  RxBool isShorletStoryUpdating = false.obs;
  RxBool isShorletPricesUpdating = false.obs;
  RxBool isShorletAvailabilityUpdating = false.obs;
  RxBool isShorletCheckInOutTimeUpdating = false.obs;
  RxBool isShorletMinimumCheckInPeriodUpdating = false.obs;
  RxBool isShorletApartmentDetailsUpdating = false.obs;
  RxBool isShorletAmenitiesUpdating = false.obs;
  RxBool isShorletSafetyFeaturesUpdating = false.obs;
  RxBool isShorletStandoutAmenitiesUpdating = false.obs;
  RxBool isShorletHouseRulesUpdating = false.obs;
  RxBool isShorletAddressUpdating = false.obs;
  RxList<AppFileModel> selectedImages = <AppFileModel>[].obs;
  Rx<ApartmentTypeModel> selectedApartment = ApartmentTypeModel.empty().obs;
  final apartmentTypes = LocalDatabase.apartmentTypes;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  RxString checkInValue = "Check-in time".obs;
  RxString checkOutValue = "Checkout time".obs;
  RxString minimumCheckInValue = "1 night".obs;
  RxString currentStateValue = "Select a state".obs;
  RxString currentStateLga = "Select your lga".obs;

  @override
  void onInit() {
    super.onInit();
    apartmentPrice = TextEditingController();
    cautionPriceCon = TextEditingController();
    shorletNameCon = TextEditingController();
    shorletAnyStoryCon = TextEditingController();
    shorletApartmentPriceCon = TextEditingController();
    addressStreetNameCon = TextEditingController();
    addressHouseNumberCon = TextEditingController();
    addressPostalCodeCon = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    apartmentPrice.dispose();
    cautionPriceCon.dispose();
    shorletNameCon.dispose();
    shorletApartmentPriceCon.dispose();
    addressStreetNameCon.dispose();
    addressHouseNumberCon.dispose();
    addressPostalCodeCon.dispose();
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
      AppLoaderService.startLoader(loaderText: "Editing price...");

      if (!(apartmentPriceKey.currentState?.validate() ?? false)) {
        AppLoaderService.stopLoader();
        return;
      }

      final updatedCopy = shortlet.copyWith(
        apartmentPrice: shortletFee,
        cautionFee: AppFunctions.getPriceFromController(cautionPriceCon),
      );

      //
      await shortletRepo.editShorlet(shorlet: updatedCopy);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good",
        message: "shortlet price updated",
      );
      AppNagivator.goBack();
      //note: once line 119 is executed, the view that injects the dependency gets disposed of the nav stack and so is the controller
    } catch (e) {
      AppLoaderService.stopLoader();
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Something went wrong editing price",
      );
    } finally {
      apartmentPriceKey.currentState?.reset();
      cautionPriceCon.clear();
      shortletFee = 0.0;
    }
  }

  void updateShortletName({required ShortletModel shorlet}) async {
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
      if (!(apartmentNameKey.currentState?.validate() ?? false)) {
        return;
      }
      isShorletNameUpdating.value = true;
      //
      final updatedShortlet = shorlet.copyWith(
        apartmentName: shorletNameCon.text.trim(),
      );

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
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
    } finally {
      apartmentNameKey.currentState?.reset();
      shorletNameCon.clear();
      isShorletNameUpdating.value = false;
    }
  }

  void updateShortletImages({required ShortletModel shortlet}) async {
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

      //check
      if (selectedImages.isEmpty) {
        AlertServices.warningSnackBar(
          title: "warning",
          message: "You should select at least an image",
        );
        return;
      }
      areImagesUpdating.value = true;
      //
      List<String> uploadedImages =
          await AppFunctions.uploadSelectedImagesToCloud(
        uid: shortlet.uid!,
        selectedImages: selectedImages,
      );

      await shortletRepo.editSpecificShorletDetails(
        shorletId: shortlet.uid!,
        data: {
          "apartmentImages": FieldValue.arrayUnion(uploadedImages),
        },
      );

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
      selectedImages.clear();
      areImagesUpdating.value = false;
    }
  }

  void onSelectedApartmentUpdate(ApartmentTypeModel apartmentType) =>
      selectedApartment.value = apartmentType;

  void updateApartmentType({required ShortletModel shortlet}) async {
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
      selectedApartment.value = ApartmentTypeModel.empty();
      isApartmentTypeUpdating.value = false;
    }
  }

  void updateShortletStory({required ShortletModel shortlet}) async {
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
      shorletAnyStoryCon.clear();
      isShorletStoryUpdating.value = false;
    }
  }

  void updateShortletAvailability({required ShortletModel shortlet}) async {
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
      final firstDate = shortlet.availableDates[0];
      final secondDate = shortlet.availableDates[1];
      if (firstDate == dateInFocusedDay.value &&
          secondDate == dateOutFocusedDay.value) {
        return;
      }

      isShorletAvailabilityUpdating.value = true;

      //
      final updatedShortlet = shortlet.copyWith(availableDates: [
        dateInFocusedDay.value,
        dateOutFocusedDay.value,
      ]);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);

      //
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Shortlet availability updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "Availability not updated",
      );
    } finally {
      //reset values
      dateInFocusedDay.value = DateTime.now();
      dateOutFocusedDay.value = DateTime.now();
      isShorletAvailabilityUpdating.value = false;
    }
  }

  void updateShortletCheckInAndOutTime({required ShortletModel shorlet}) async {
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
      if (checkInValue.value == "Check-in time" ||
          checkOutValue.value == "Checkout time") {
        return;
      }
      isShorletCheckInOutTimeUpdating.value = true;
      //
      final updatedShortlet = shorlet.copyWith(
        checkInTime: checkInValue.value,
        checkOutTime: checkOutValue.value,
      );

      await shortletRepo.editShorlet(shorlet: updatedShortlet);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Checkin and out time updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "Checkin and out time  not updated",
      );
    } finally {
      checkInValue.value = "Check-in time";
      checkOutValue.value = "Checkout time";
      checkInValue.refresh();
      checkOutValue.refresh();
      isShorletCheckInOutTimeUpdating.value = false;
    }
  }

  void updateShortletMinimumCheckInPeriod(
      {required ShortletModel shorlet}) async {
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
      if (shorlet.minimumCheckInTime == minimumCheckInValue.value) {
        return;
      }
      isShorletMinimumCheckInPeriodUpdating = true.obs;

      //
      final updatedShortlet = shorlet.copyWith(
        minimumCheckInTime: minimumCheckInValue.value,
      );

      await shortletRepo.editShorlet(shorlet: updatedShortlet);

      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Minimum checkin updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.successSnackBar(
        title: "Oh snap!",
        message: "Minimum checkin not updated",
      );
    } finally {
      minimumCheckInValue.value = "1 night";
      minimumCheckInValue.refresh();
      isShorletMinimumCheckInPeriodUpdating.value = false;
    }
  }

  void updateShortletApartmentDetails({required ShortletModel shortlet}) async {
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
      isShorletApartmentDetailsUpdating = true.obs;

      //
      final updatedShortlet =
          shortlet.copyWith(apartmentDetails: shortlet.apartmentDetails);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Apartment details updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Apartment details not updated",
      );
    } finally {
      isShorletApartmentDetailsUpdating.value = false;
    }
  }

  void updateShortletAmenities({required ShortletModel shortlet}) async {
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
      isShorletAmenitiesUpdating = true.obs;

      //
      final updatedShortlet = shortlet.copyWith(amenities: shortlet.amenities);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Apartment amenities updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Apartment amenities not updated",
      );
    } finally {
      isShorletAmenitiesUpdating.value = false;
    }
  }

  void updateShortletSafetyFeatures({required ShortletModel shortlet}) async {
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
      isShorletSafetyFeaturesUpdating = true.obs;

      //
      final updatedShortlet =
          shortlet.copyWith(safetyFeatures: shortlet.safetyFeatures);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Safety features updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Safety features not updated",
      );
    } finally {
      isShorletSafetyFeaturesUpdating.value = false;
    }
  }

  void updateShortletStandoutAmenities(
      {required ShortletModel shortlet}) async {
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
      isShorletStandoutAmenitiesUpdating = true.obs;

      //
      final updatedShortlet =
          shortlet.copyWith(standOutAmenities: shortlet.standOutAmenities);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "Standout amenities updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Standout amenities not updated",
      );
    } finally {
      isShorletStandoutAmenitiesUpdating.value = false;
    }
  }

  void updateShortletHouseRules({required ShortletModel shortlet}) async {
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
      isShorletHouseRulesUpdating = true.obs;

      //
      final updatedShortlet =
          shortlet.copyWith(houseRules: shortlet.houseRules);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Good!",
        message: "House rules updated",
      );
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "House rules not updated",
      );
    } finally {
      isShorletHouseRulesUpdating.value = false;
    }
  }

  void updateShorletAddress({required ShortletModel shortlet}) async {
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

      isShorletAddressUpdating.value = true;

      //
      final updatedAddress = shortlet.address.copyWith(
        houseNumber: addressHouseNumberCon.text.isNotEmpty
            ? addressHouseNumberCon.text.trim()
            : shortlet.address.houseNumber,
        streetName: addressStreetNameCon.text.isNotEmpty
            ? addressStreetNameCon.text.trim()
            : shortlet.address.streetName,
        postalCode: addressPostalCodeCon.text.isNotEmpty
            ? addressPostalCodeCon.text.trim()
            : shortlet.address.postalCode,
        lga: currentStateLga.value != "Select a lga"
            ? currentStateLga.value
            : shortlet.address.lga,
        state: currentStateValue.value != "Select a state"
            ? currentStateValue.value
            : shortlet.address.state,
      );
      final updatedShortlet = shortlet.copyWith(address: updatedAddress);

      await shortletRepo.editShorlet(shorlet: updatedShortlet);

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
      isShorletAddressUpdating.value = false;
    }
  }
}
