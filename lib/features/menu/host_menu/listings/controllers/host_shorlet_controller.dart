import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/data/repositories/shortlet_repository/shorlet_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/features/menu/customer_menu/home/model/apartment_type_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/address_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/apartment_detail_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';
import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../data/services/media_service.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/device/app_device_services/app_device_services.dart';
import '../model/apartment_amenities_model.dart';
import '../model/apartment_house_rules_model.dart';
import '../model/id_type_model.dart';
import 'dart:developer';

class HostShorletController extends GetxController {
  static HostShorletController get instance => Get.find();

  ///variables
  final PageController shortletCreationPageController = PageController();
  RxInt currentPageSelected = 0.obs;

  void onContinueToNextPage(int currentPageValue) =>
      currentPageSelected.value = currentPageValue;

  final ShorletRepository shortletRepo = Get.put(ShorletRepository());
  final MediaServiceController mediaService = Get.put(MediaServiceController());
  final String _currentUserId = AuthRepository.instance.currentUser!.uid;

  //
  Rx<ApartmentTypeModel> selectedApartType = ApartmentTypeModel.empty().obs;
  Rx<IdTypeModel> selectedIdType = IdTypeModel.empty().obs;
  final GlobalKey<FormState> apartmentDescFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressDescFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> apartmentFeeFormKey = GlobalKey<FormState>();
  final apartmentTypes = LocalDatabase.apartmentTypes;
  final double servicePerecent = 12.5;
  double shorletFee = 0.0;
  late final TextEditingController apartmentNameCon;
  late final TextEditingController apartmentStoryCon;
  late final TextEditingController addressCon;
  late final TextEditingController apartmentPriceCon;
  late final TextEditingController apartmentCautionFeeCon;

  RxBool isTizelaTermsForPriceAcceptetd = false.obs;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  RxString checkInTime = "Check-in time".obs;
  RxString checkOutTime = "Checkout time".obs;
  RxString minimumCheckInTime = "1 night".obs;
  List<ApartmentDetailModel> selectedApartmentDetails =
      LocalDatabase.selectedApartmentDetails;
  List<ApartmentAmenitiesModel> selectedAmenities =
      LocalDatabase.selectedAmenities;
  List<ApartmentAmenitiesModel> selectedSafetyFeatures =
      LocalDatabase.selectedSafetyFeatures;
  List<ApartmentAmenitiesModel> selectedStandOutAmenities =
      LocalDatabase.selectedStandOutAmenities;
  List<ApartmentHouseRulesModel> apartHouseRules =
      LocalDatabase.apartHouseRules;
  RxList<IdTypeModel> availableIdTypes = LocalDatabase.availableIdTypes;
  RxSet<AppFileModel> livingRoomImagesSelected = <AppFileModel>{}.obs;
  RxSet<AppFileModel> bedImagesSelected = <AppFileModel>{}.obs;
  RxSet<AppFileModel> bathroomImagesSelected = <AppFileModel>{}.obs;
  RxSet<AppFileModel> kitchenImagesSelected = <AppFileModel>{}.obs;
  RxSet<AppFileModel> amenitiesImagesSelected = <AppFileModel>{}.obs;
  Rx<AppFileModel> idFrontPage = AppFileModel.empty().obs;
  Rx<AppFileModel> idBackPage = AppFileModel.empty().obs;

  ///methods
  void onFirstHouseRuleChanged({
    required ApartmentHouseRulesModel houseRule,
  }) {
    houseRule.isFirstValue.value = true;
    houseRule.isSecondValue.value = false;
    houseRule.isActive.value = true;
  }

  void onSecondHouseRuleChanged({
    required ApartmentHouseRulesModel houseRule,
  }) {
    houseRule.isFirstValue.value = false;
    houseRule.isSecondValue.value = true;
    houseRule.isActive.value = false;
  }

  void onCheckInChanged(String value) => checkInTime.value = value;
  void onCheckOutChanged(String value) => checkOutTime.value = value;
  void onMinimumCheckInChanged(String value) =>
      minimumCheckInTime.value = value;

  void onAmenitiySelected(
          {required bool? newValue, required RxBool oldValue}) =>
      oldValue.value = newValue ?? false;

  void incrementCount(RxInt itemCount) {
    if (itemCount.value != 5) {
      itemCount.value++;
    }
  }

  void decrementCount(RxInt itemCount) {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }

  void onDateInDateSelected(DateTime date, DateTime selectedDay) =>
      dateInFocusedDay.value = date;

  void onDateOutDateSelected(DateTime date, DateTime selectedDay) =>
      dateOutFocusedDay.value = date;

  @override
  void onInit() {
    super.onInit();
    apartmentNameCon = TextEditingController();
    apartmentStoryCon = TextEditingController();
    addressCon = TextEditingController();
    apartmentPriceCon = TextEditingController();
    apartmentCautionFeeCon = TextEditingController();
  }

  void addImages({required RxSet<AppFileModel> imagesSelected}) async {
    try {
      File? pickedImage = await mediaService.pickImageFromGallery();
      if (pickedImage != null) {
        final fileName = AppDeviceServices.getImageName(imageFile: pickedImage);
        final fileSize = await AppDeviceServices.getFileSize(file: pickedImage);
        final appImageFile = AppFileModel(
          file: pickedImage,
          name: fileName,
          size: fileSize,
        );

        if (!imagesSelected.contains(appImageFile)) {
          imagesSelected.add(appImageFile);
        } else {
          AlertServices.warningSnackBar(
            title: "Oh snap",
            message: "file already exists, select another",
          );
        }
      }
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "image could not be selected",
      );
    }
  }

  void updateTizelaTerms(bool? newValue) {
    if (newValue != null) {
      isTizelaTermsForPriceAcceptetd.value = newValue;
    }
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee = double.tryParse(apartmentPriceCon.text.trim());
    double finalPrice = 0.0;
    if (apartmentFee != null) {
      finalPrice = apartmentFee;
    }
    double serviceCharge = finalPrice * servicePerecent / 100;
    final shortletPrice = finalPrice - serviceCharge;
    shorletFee = shortletPrice;
    return shortletPrice.toStringAsFixed(2);
  }

  void updateSelectdApartType(
      {required ApartmentTypeModel newSelectedApartment}) {
    selectedApartType.value = newSelectedApartment;
    selectedApartType.refresh();
  }

  void updateSelectedIdChanged({required int itemIndex}) {
    //deselect all others
    for (var item in availableIdTypes) {
      item.isActive.value = false;
    }

    //assign the selected
    selectedIdType.value = availableIdTypes[itemIndex];
    selectedIdType.value.isActive.value = true;
  }

  void selectIdCardType({
    required Rx<AppFileModel> id,
  }) async {
    try {
      if (!selectedIdType.value.isActive.value) {
        AlertServices.warningSnackBar(
            title: "Oh snap", message: "Select an Id type first");
        return;
      }

      File? pickedId = await mediaService.pickFile();
      if (pickedId != null) {
        final fileName =
            AppDeviceServices.getImageName(imageFile: pickedId, index: 8);
        final fileSize = await AppDeviceServices.getFileSize(file: pickedId);

        id.value = id.value.copyWith(
          name: fileName,
          file: pickedId,
          size: fileSize,
        );

        if (!selectedIdType.value.idFiles.contains(id.value.file)) {
          selectedIdType.value.idFiles.add(id.value.file);
        }
      }
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "id could not be selected",
      );
    }
  }

  //create a new listing
  void createNewShortletListing() async {
    try {
      //show loader
      AppLoaderService.startLoader(
        loaderText: "Creating shorlet, please wait...",
      );

      //
      if (selectedApartType.value.name.length < 2) {
        AppLoaderService.stopLoader();
        AlertServices.warningSnackBar(
          title: "Oh snap",
          message: "Select an apartment",
        );
        return;
      }
      //todo: verify details before creating resource

      //upload all images
      List<String> uploadedImages = await _uploadImages();

      final newShortlet = ShortletModel(
        userId: _currentUserId,
        apartmentType: selectedApartType.value,
        apartmentName: apartmentNameCon.text.trim(),
        anyStory: apartmentStoryCon.text.trim(),
        address: AddressModel(addressText: addressCon.text.trim()),
        apartmentPrice: AppFunctions.getPriceFromController(apartmentPriceCon),
        cautionFee: shorletFee,
        ratingsCount: 0.0,
        availableDates: [dateInFocusedDay.value, dateOutFocusedDay.value],
        checkInTime: checkInTime.value,
        checkOutTime: checkOutTime.value,
        minimumCheckInTime: minimumCheckInTime.value,
        apartmentDetails: selectedApartmentDetails,
        amenities: selectedAmenities,
        safetyFeatures: selectedSafetyFeatures,
        standOutAmenities: selectedStandOutAmenities,
        houseRules: apartHouseRules,
        thumbImage: uploadedImages.first,
        apartmentImages: uploadedImages,
        idType: selectedIdType.value,
      );

      await shortletRepo.createNewShorlet(shorlet: newShortlet);
      _resetResourses();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(title: "New shorlet created!");
      AppNagivator.goBack(Get.context!);
    } catch (e) {
      AppDebugger.debugger(e);
      AppLoaderService.stopLoader();
      AlertServices.errorSnackBar(
        title: 'Oh Snap!',
        message: "something went wrong",
      );
    }
  }

  void _resetResourses() {
    apartmentNameCon.clear();
    apartmentStoryCon.clear();
    addressCon.clear();
    apartmentPriceCon.clear();
    apartmentCautionFeeCon.clear();
    //
    selectedApartType.value = ApartmentTypeModel.empty();
    selectedIdType.value = IdTypeModel.empty();

    //
    apartmentDescFormKey.currentState?.reset();
    addressDescFormKey.currentState?.reset();
    apartmentFeeFormKey.currentState?.reset();

    //
    isTizelaTermsForPriceAcceptetd.value = false;
    dateInFocusedDay.value = DateTime.now();
    dateOutFocusedDay.value = DateTime.now();
    checkInTime.value = "Check-in time";
    checkOutTime.value = "Checkout time";
    minimumCheckInTime.value = "1 night";
    livingRoomImagesSelected = <AppFileModel>{}.obs;
    bedImagesSelected = <AppFileModel>{}.obs;
    bathroomImagesSelected = <AppFileModel>{}.obs;
    kitchenImagesSelected = <AppFileModel>{}.obs;
    amenitiesImagesSelected = <AppFileModel>{}.obs;
    idFrontPage.value = AppFileModel.empty();
    idBackPage.value = AppFileModel.empty();

    //
    selectedApartmentDetails = LocalDatabase.selectedApartmentDetails;
    selectedAmenities = LocalDatabase.selectedAmenities;
    selectedSafetyFeatures = LocalDatabase.selectedSafetyFeatures;
    selectedStandOutAmenities = LocalDatabase.selectedStandOutAmenities;
    apartHouseRules = LocalDatabase.apartHouseRules;
  }

  Future<List<String>> _uploadImages() async {
    final List<File> images = [
      ...livingRoomImagesSelected.map((x) => x.file),
      ...bedImagesSelected.map((x) => x.file),
      ...bathroomImagesSelected.map((x) => x.file),
      ...kitchenImagesSelected.map((x) => x.file),
      ...amenitiesImagesSelected.map((x) => x.file),
    ];

    final List<String> uploadedImages = [];

    for (var imageFile in images) {
      final String? downloadUrl = await mediaService.uploadImageTo(
        currentUid: _currentUserId,
        imageFile: imageFile,
      );

      if (downloadUrl != null) {
        uploadedImages.add(downloadUrl);
      }
    }
    return uploadedImages;
  }

  Stream<List<ShortletModel>>? fetchShortletsAsStream() {
    try {
      final shortlets = shortletRepo.fetchHostShorlets(uid: _currentUserId);

      return shortlets;
    } catch (e) {
      log(e.toString());
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "error fetching shortlets",
      );
      return null;
    }
  }
}
