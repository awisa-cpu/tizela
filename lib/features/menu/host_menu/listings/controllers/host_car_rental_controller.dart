import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/data/repositories/car_rental_repository/car_rental_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/data/services/media_service.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_brand_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/device/app_device_services/app_device_services.dart';
import '../model/address_model.dart';
import '../model/car_rental_details_model.dart';
import '../model/car_rental_features_model.dart';

class HostCarRentalController extends GetxController {
  static HostCarRentalController get instance =>
      Get.find<HostCarRentalController>();

  ///variables
  final MediaServiceController mediaService = MediaServiceController.instance;
  final String _currentUserId = AuthRepository.instance.currentUser!.uid;
  final CarRentalRepository carRentalRepo = Get.put(CarRentalRepository());
  final PageController carRentalCreationPageController = PageController();

  //
  RxInt currentSelectedPageIndex = 0.obs;
  final carModels = LocalDatabase.carBrandModels;
  final List<String> carTypes = LocalDatabase.carTypeName;
  RxString selectedCarType = "".obs;
  Rx<CarBrandModel> selectedCarBrand = CarBrandModel.empty().obs;
  RxString currentCarYear = "Car Year".obs;
  final GlobalKey<FormState> carRentaladdKey = GlobalKey<FormState>();
  final GlobalKey<FormState> carRentalPriceFormKey = GlobalKey<FormState>();
  late TextEditingController carRentalAddressController;
  late TextEditingController carRentalApartmentPriceController;
  RxBool isTizelaTandCAccepted = false.obs;
  final double servicePerecent = 12.5;
  double carRentalFee = 0.0;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  List<CarRentalDetailsModel> carDetails = LocalDatabase.carDetails;
  List<CarRentalFeaturesModel> carFeatures = LocalDatabase.carFeatures;
  List<CarRentalFeaturesModel> carRentalSafetyFeatures =
      LocalDatabase.carRentalSafetyFeatures;
  List<CarRentalFeaturesModel> carPolicies = LocalDatabase.carRules;
  List<CarRentalFeaturesModel> driverPolicies = LocalDatabase.carRules2;
  RxSet<AppFileModel> carImagesSelected = <AppFileModel>{}.obs;

  ///methods
  @override
  void onInit() {
    super.onInit();
    carRentalAddressController = TextEditingController();
    carRentalApartmentPriceController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    carRentalAddressController.dispose();
    carRentalApartmentPriceController.dispose();
  }

  void resetRosourses() {
    carRentaladdKey.currentState?.reset();
    carRentalPriceFormKey.currentState?.reset();
    carRentalAddressController.clear();
    carRentalApartmentPriceController.clear();
  }

  void onCurrentPageChanged(int newPageIndex) =>
      currentSelectedPageIndex.value = newPageIndex;

  void onUpdateCarTypeSelected(String carType) =>
      selectedCarType.value = carType;

  void onUpdateCarBrandSelected(CarBrandModel carBrand) =>
      selectedCarBrand.value = carBrand;

  void onCarYearChanged(String newValue) => currentCarYear.value = newValue;

  void onChangedTizelaTandC(bool? newValue) {
    if (newValue != null) {
      isTizelaTandCAccepted.value = newValue;
    }
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee =
        double.tryParse(carRentalApartmentPriceController.text.trim());
    double finalPrice = 0.0;

    if (apartmentFee != null) {
      finalPrice = apartmentFee;
    }

    double serviceCharge = finalPrice * (servicePerecent / 100);
    double boatPrice = finalPrice - serviceCharge;
    carRentalFee = boatPrice;
    return boatPrice.toStringAsFixed(2);
  }

  void onDayInDateSelected(DateTime date, DateTime selectedDay) =>
      dateInFocusedDay.value = date;
  void onDayOutDateSelected(DateTime date, DateTime selectedDay) =>
      dateOutFocusedDay.value = date;

  void onCarDetailsIncrementCount({required CarRentalDetailsModel carDetail}) {
    if (carDetail.detailCount.value != 5) {
      carDetail.detailCount.value++;
    }
  }

  void carDetailDecrementCount({required CarRentalDetailsModel carDetails}) {
    if (carDetails.detailCount.value > 0) {
      carDetails.detailCount.value--;
    }
  }

  void onCarRenCheckBoxChanged({
    required bool? newValue,
    required CarRentalFeaturesModel feature,
  }) {
    if (newValue != null) {
      feature.isActive.value = newValue;
    }
  }

  void addCarImages({required RxSet<AppFileModel> carImages}) async {
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

        if (!carImages.contains(appImageFile)) {
          carImages.add(appImageFile);
        }
      }
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "image could not be selected",
      );
    }
  }

  void createNewCarRental() async {
    try {
      AppLoaderService.startLoader(
        loaderText: "Creating carrental, please wait...",
      );

      //todo: verify details

      final uploadedImages = await _uploadImagesToFirebase();

      final CarRentalModel newCarRental = CarRentalModel(
        userId: _currentUserId,
        carType: selectedCarType.value,
        carBrand: selectedCarBrand.value,
        carYear: currentCarYear.value,
        address:
            AddressModel(addressText: carRentalAddressController.text.trim()),
        carPrice: carRentalFee,
        ratingsCount: 0.0,
        availableDates: [dateInFocusedDay.value, dateOutFocusedDay.value],
        carRentalDetails: carDetails,
        carRentalFeatures: carFeatures,
        safetyFeatures: carRentalSafetyFeatures,
        carPolicies: carPolicies,
        driverPolicies: driverPolicies,
        carImages: uploadedImages,
      );

      await carRentalRepo.createNewCarRental(carRental: newCarRental);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Congratulations",
        message: "Car rental successfully created!",
      );
      AppNagivator.goBack(Get.context!);
    } catch (e) {
      AppLoaderService.stopLoader();
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "error occured while creating car rental",
      );
    }
  }

  void _resetResources() {
    selectedCarType.value = "";
    selectedCarBrand.value = CarBrandModel.empty();
    currentCarYear.value = "";
    carRentalAddressController.clear();
    carRentalApartmentPriceController.clear();
    dateInFocusedDay.value = DateTime.now();
    dateOutFocusedDay.value = DateTime.now();
    carDetails = LocalDatabase.carDetails;
    carFeatures = LocalDatabase.carFeatures;
    carRentalSafetyFeatures = LocalDatabase.carRentalSafetyFeatures;
    carPolicies = LocalDatabase.carRules;
    driverPolicies = LocalDatabase.carRules2;
    carImagesSelected = <AppFileModel>{}.obs;
  }

  Future<List<String>> _uploadImagesToFirebase() async {
    final images = carImagesSelected.map((image) => image.file).toList();

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

  Stream<List<CarRentalModel>>? fetchCarRentalsAsStream() {
    try {
      final carRentalStream = carRentalRepo.fetchAllCarRentalAsStream(
        currentUserId: _currentUserId,
      );

      return carRentalStream;
    } catch (e) {
      AppDebugger.debugger(e);
      AlertServices.errorSnackBar(
        title: "Oh snap!",
        message: "Error fetching data",
      );
      return null;
    }
  }
}
