import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/data/repositories/car_rental_repository/car_rental_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/app_loader_services.dart';
import 'package:tizela/data/services/network_service.dart';
import 'package:tizela/features/menu/host_menu/listings/model/app_file_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_brand_model.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import '../../../../../data/repositories/auth_repository/auth_repository.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../model/address_model.dart';
import '../model/car_rental_details_model.dart';
import '../model/car_rental_features_model.dart';

class HostCarRentalController extends GetxController {
  static HostCarRentalController get instance =>
      Get.find<HostCarRentalController>();

  ///variables
  final String _currentUserId = AuthRepository.instance.currentUser!.uid;
  final CarRentalRepository carRentalRepo = CarRentalRepository.instance;
  final PageController carRentalCreationPageController = PageController();

  //
  RxInt currentSelectedPageIndex = 0.obs;
  List<CarBrandModel> carModels = LocalDatabase.carBrandModels;
  List<String> carTypes = LocalDatabase.carTypeName;
  RxString selectedCarType = "".obs;
  Rx<CarBrandModel> selectedCarBrand = CarBrandModel.empty().obs;
  RxString currentCarYear = "Car Year".obs;
  final GlobalKey<FormState> carRentaladdressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> carRentalPriceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> carRentalNameFormKey = GlobalKey<FormState>();
  late TextEditingController carRentalAddressController;
  late TextEditingController carRentalApartmentPriceController;
  late TextEditingController carRentalNameController;
  late final TextEditingController addressStreetNameCon;
  late final TextEditingController addressHouseNumberCon;
  late final TextEditingController addressPostalCodeCon;
  RxString currentStateValue = "Select a state".obs;
  RxString currentStateLga = "Select your lga".obs;
  RxBool isTizelaTandCAccepted = false.obs;
  RxBool isIntraStateMovement = false.obs;
  RxBool isInterStateMovement = false.obs;
  RxBool isCarMovementOutsideState = false.obs;
  double carRentalFee = 0.0;
  Rx<DateTime> dateInFocusedDay = DateTime.now().obs;
  Rx<DateTime> dateOutFocusedDay = DateTime.now().obs;
  List<CarRentalDetailsModel> carDetails = LocalDatabase.carDetails;
  List<CarRentalFeaturesModel> carFeatures = LocalDatabase.carFeatures;
  List<CarRentalFeaturesModel> carRentalSafetyFeatures =
      LocalDatabase.carRentalSafetyFeatures;
  List<CarRentalFeaturesModel> carPolicies = LocalDatabase.carRules;
  List<CarRentalFeaturesModel> driverPolicies = LocalDatabase.carRules2;
  RxList<AppFileModel> carImagesSelected = <AppFileModel>[].obs;

  ///methods
  @override
  void onInit() {
    super.onInit();
    carRentalAddressController = TextEditingController();
    carRentalApartmentPriceController = TextEditingController();
    carRentalNameController = TextEditingController();
    addressStreetNameCon = TextEditingController();
    addressHouseNumberCon = TextEditingController();
    addressPostalCodeCon = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    carRentalAddressController.dispose();
    carRentalApartmentPriceController.dispose();
    carRentalNameController.dispose();
    addressStreetNameCon.dispose();
    addressHouseNumberCon.dispose();
    addressPostalCodeCon.dispose();
  }

  String calculateEarningAfterServiceCharge() {
    final apartmentFee =
        AppFunctions.getPriceFromController(carRentalApartmentPriceController);
    double finalPrice = 0.0;

    if (apartmentFee != 0.0) {
      finalPrice = apartmentFee;
    }

    double serviceCharge = finalPrice * (12.5 / 100);
    double boatPrice = finalPrice - serviceCharge;
    carRentalFee = boatPrice;
    return boatPrice.toStringAsFixed(2);
  }

  void createNewCarRental() async {
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
      //start loader
      AppLoaderService.startLoader(
        loaderText: "Creating carrental, please wait...",
      );

      //todo: verify details

      //upload selected images to cloud
      final uploadedImages = await AppFunctions.uploadSelectedImagesToCloud(
        selectedImages: carImagesSelected,
        uid: _currentUserId,
      );

      //create address

      final newAddress = AddressModel(
        houseNumber: addressHouseNumberCon.text.trim(),
        streetName: addressStreetNameCon.text.trim(),
        postalCode: addressPostalCodeCon.text.trim(),
        state: currentStateValue.value,
        lga: currentStateLga.value,
      );

      //create the car-rental
      final CarRentalModel newCarRental = CarRentalModel(
        userId: _currentUserId,
        carType: selectedCarType.value,
        carName: carRentalNameController.text.trim(),
        carYear: currentCarYear.value,
        carBrand: selectedCarBrand.value,
        address: newAddress,
        carPrice: carRentalFee,
        ratingsCount: 0.0,
        availableDates: [dateInFocusedDay.value, dateOutFocusedDay.value],
        carRentalDetails: carDetails,
        carRentalFeatures: carFeatures,
        safetyFeatures: carRentalSafetyFeatures,
        carPolicies: carPolicies,
        driverPolicies: driverPolicies,
        carImages: uploadedImages,
        isCarMovementOutsideState: isCarMovementOutsideState.value,
      );

      await carRentalRepo.createNewCarRental(carRental: newCarRental);
      _resetResources();
      AppLoaderService.stopLoader();
      AlertServices.successSnackBar(
        title: "Congratulations",
        message: "Car rental successfully created!",
      );
      AppNagivator.goBack();
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
    currentStateLga.value = "Select your lga";
    currentStateValue.value = "Select a state";

    //
    carRentaladdressKey.currentState?.reset();
    carRentalPriceFormKey.currentState?.reset();
    carRentalNameFormKey.currentState?.reset();
    carRentalAddressController.clear();
    carRentalApartmentPriceController.clear();
    carRentalNameController.clear();
    addressStreetNameCon.clear();
    addressHouseNumberCon.clear();
    addressPostalCodeCon.clear();

    //
    isTizelaTandCAccepted.value = false;
    carRentalFee = 0.0;
    dateInFocusedDay.value = DateTime.now();
    dateOutFocusedDay.value = DateTime.now();
    carDetails = LocalDatabase.carDetails;
    carFeatures = LocalDatabase.carFeatures;
    carModels = LocalDatabase.carBrandModels;
    carTypes = LocalDatabase.carTypeName;
    carRentalSafetyFeatures = LocalDatabase.carRentalSafetyFeatures;
    carPolicies = LocalDatabase.carRules;
    driverPolicies = LocalDatabase.carRules2;
    carImagesSelected.clear();

    //
    isIntraStateMovement.value = false;
    isInterStateMovement.value = false;
    isCarMovementOutsideState.value = false;
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
