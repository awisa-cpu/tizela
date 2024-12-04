import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:tizela/data/local_database.dart";
import "package:tizela/data/repositories/auth_repository/auth_repository.dart";
import "package:tizela/data/services/alert_services.dart";
import "package:tizela/data/services/app_loader_services.dart";
import "package:tizela/features/menu/host_menu/listings/model/address_model.dart";
import "package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart";
import "package:tizela/features/menu/host_menu/listings/model/boat_type_model.dart";
import "../../../../../data/repositories/boat_cruise_repository/boat_cruise_repository.dart";
import "../../../../../data/services/media_service.dart";
import "../../../../../setup/app_navigator.dart";
import "../../../../../utils/device/app_debugger/app_debugger.dart";
import "../../../../../utils/device/app_device_services/app_device_services.dart";
import "../model/app_file_model.dart";
import "../model/boat_cruise_details_model.dart";
import "../model/boat_cruise_features_model.dart";

class HostBoatCruiseController extends GetxController {
  static HostBoatCruiseController get instance => Get.find();

//variables
  final PageController hostBoatCruisePageCon = PageController();
  final MediaServiceController mediaService = MediaServiceController.instance;
  final BoatCruiseRepository boatCruiseRepo = Get.put(BoatCruiseRepository());
  final String _currentUserId = AuthRepository.instance.currentUser!.uid;

  //
  RxInt currentSelectedPageIndex = 0.obs;
  Rx<BoatTypeModel> selectedBoatType = BoatTypeModel.empty().obs;
  late TextEditingController boatNameController;
  late TextEditingController boatStoryController;
  late TextEditingController boatAddressController;
  late TextEditingController boatPriceController;

  //
  final GlobalKey<FormState> boatdescriptionKey = GlobalKey<FormState>();
  final GlobalKey<FormState> boatAddressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> boatPriceKey = GlobalKey<FormState>();

  //
  RxBool isTizelaTandCAccepted = false.obs;
  final double servicePerecent = 12.5;
  double boatFee = 0.0;
  Rx<DateTime> dateInFocused = DateTime.now().obs;
  Rx<DateTime> dateOutFocused = DateTime.now().obs;
  final boatTypes = LocalDatabase.boatTypes;
  List<BoatCruiseDetailsModel> boatDetails = LocalDatabase.boatDetails;
  List<BoatCruiseFeaturesModel> boatAmenities = LocalDatabase.boatAmenities;
  List<BoatCruiseFeaturesModel> boatSafety = LocalDatabase.boatSafety;
  List<BoatCruiseFeaturesModel> boatSpecialtyAmenities =
      LocalDatabase.boatSpecialtyAmenities;
  List<BoatCruiseFeaturesModel> boatPolicies = LocalDatabase.boatPolicies;
  List<BoatCruiseFeaturesModel> boatSailorPolicies =
      LocalDatabase.boatSailorPolicies;
  RxSet<AppFileModel> boatImagesSelected = <AppFileModel>{}.obs;

  //methods

  @override
  void onInit() {
    super.onInit();
    boatNameController = TextEditingController();
    boatStoryController = TextEditingController();
    boatAddressController = TextEditingController();
    boatPriceController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    boatNameController.dispose();
    boatStoryController.dispose();
    boatAddressController.dispose();
    boatPriceController.dispose();
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee = double.tryParse(boatPriceController.text.trim());
    double finalPrice = 0.0;

    if (apartmentFee != null) {
      finalPrice = apartmentFee;
    }

    double serviceCharge = finalPrice * servicePerecent / 100;
    final boatPrice = finalPrice - serviceCharge;
    boatFee = boatPrice;
    return boatPrice.toStringAsFixed(2);
  }

  void addBoatImages({required RxSet selectedImages}) async {
    try {
      final imageFile = await mediaService.pickImageFromGallery();
      if (imageFile != null) {
        final imageName = AppDeviceServices.getImageName(imageFile: imageFile);
        final imageSize = await AppDeviceServices.getFileSize(file: imageFile);
        final AppFileModel appImageFile = AppFileModel(
          file: imageFile,
          name: imageName,
          size: imageSize,
        );

        if (!selectedImages.contains(appImageFile)) {
          selectedImages.add(appImageFile);
        }
      }
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "image could not be selected",
      );
    }
  }

  Future<List<String>> _uploadImages() async {
    final images = boatImagesSelected.map((image) => image.file).toList();

    List<String> uploadedImages = [];

    for (final image in images) {
      final String? downloadUrl = await mediaService.uploadImageTo(
        currentUid: _currentUserId,
        imageFile: image,
      );

      if (downloadUrl != null) {
        uploadedImages.add(downloadUrl);
      }
    }

    return uploadedImages;
  }

  void createNewBoatCruise() async {
    try {
      AppLoaderService.startLoader(
        loaderText: "creating boat cruise, please wait...",
      );

      //todo: verify details

      //
      final uploadedImages = await _uploadImages();

      //
      final BoatCruiseModel newBoatCruise = BoatCruiseModel(
        userId: _currentUserId,
        name: boatNameController.text.trim(),
        boatStory: boatStoryController.text.trim(),
        boatType: selectedBoatType.value,
        address: AddressModel(addressText: boatAddressController.text.trim()),
        boatFee: boatFee,
        ratingsCount: 0.0,
        availableDates: [dateInFocused.value, dateOutFocused.value],
        boatCruiseDetails: boatDetails,
        boatAmenities: boatAmenities,
        boatSafetyFeatures: boatSafety,
        boatCruiseSpecialtyAmenities: boatSpecialtyAmenities,
        boatPolicies: boatPolicies,
        boatSailorPolicies: boatSailorPolicies,
        boatImages: uploadedImages,
      );

      await boatCruiseRepo.createNewBoatCruise(boatCruise: newBoatCruise);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Successful",
        message: "biat cruise created!",
      );
      AppNagivator.goBack(Get.context!);
    } catch (e) {
      AppLoaderService.stopLoader();
      AppDebugger.debugger(e);
      AlertServices.warningSnackBar(
        title: "Oh snap",
        message: "Something went wrong, while fetching data",
      );
    }
  }

  Stream<List<BoatCruiseModel>>? fetchBoatCruisesAsStream() {
    try {
      final boatCruises = boatCruiseRepo.fetchAllBoatCruiseAsStream(
        currentUserId: _currentUserId,
      );

      return boatCruises;
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap",
        message: "Something went wrong while fetching data",
      );
      return null;
    }
  }

  void _resetResources() {
    boatNameController.clear();
    boatStoryController.clear();
    boatAddressController.clear();
    boatPriceController.clear();

    //
    boatdescriptionKey.currentState?.reset();
    boatAddressKey.currentState?.reset();
    boatPriceKey.currentState?.reset();

    //
    selectedBoatType.value = BoatTypeModel.empty();
    dateInFocused.value = DateTime.now();
    dateOutFocused.value = DateTime.now();

    //
    boatImagesSelected.clear();
    boatDetails = LocalDatabase.boatDetails;
    boatAmenities = LocalDatabase.boatAmenities;
    boatSafety = LocalDatabase.boatSafety;
    boatSpecialtyAmenities = LocalDatabase.boatSpecialtyAmenities;
    boatPolicies = LocalDatabase.boatPolicies;
    boatSailorPolicies = LocalDatabase.boatSailorPolicies;
  }
}
