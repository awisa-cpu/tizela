import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/data/repositories/shortlet_repository/shortlet_repository.dart';

import '../../../../../data/repositories/boat_cruise_repository/boat_cruise_repository.dart';
import '../../../../../data/repositories/car_rental_repository/car_rental_repository.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/device/app_debugger/app_debugger.dart';
import '../../../host_menu/listings/model/boat_cruise_model.dart';
import '../../../host_menu/listings/model/car_rental_model.dart';
import '../../../host_menu/listings/model/shortlet_model.dart';

class CustomerHomeController extends GetxController {
  //variables
  static CustomerHomeController get instance => Get.find();
  final ShortletRepository shorletRepository = Get.put(ShortletRepository());
  final CarRentalRepository carRentalRepository =
      Get.put(CarRentalRepository());
  final BoatCruiseRepository boatCruiseRepository =
      Get.put(BoatCruiseRepository());

  RxBool isStaySelected = true.obs;
  RxBool isCarRentalSelected = false.obs;
  RxBool isBoatCruiseSelected = false.obs;

  Rx<Color> stayBorderColor = AppColors.appMainColor.obs;
  Rx<Color> stayTextAndIconColor = AppColors.appMainColor.obs;
  Rx<FontWeight> stayFontWeight = FontWeight.bold.obs;

  Rx<Color> carRentalBorderColor = Colors.grey.shade200.obs;
  Rx<Color> carRentalTextAndIconColor = AppColors.appTextFadedColor.obs;
  Rx<FontWeight> carRentalFontWeight = FontWeight.normal.obs;

  Rx<Color> boatCruiseBorderColor = Colors.grey.shade200.obs;
  Rx<Color> boatCruiseTextAndIconColor = AppColors.appTextFadedColor.obs;
  Rx<FontWeight> boatCruiseFontWeight = FontWeight.normal.obs;
  RxString defaultShortletLocation = "all".obs;
  RxString defaultCarRentalLocation = "all".obs;
  RxString defaultBoatCruiseLocation = "all".obs;

  RxBool areShortletsLoading = false.obs;
  RxBool areCarRentalsLoading = false.obs;
  RxBool areBoatCruiseLoading = false.obs;
  //
  final RxList<ShortletModel> _allShortlets = <ShortletModel>[].obs;
  final RxList<CarRentalModel> _allCarRentals = <CarRentalModel>[].obs;
  final RxList<BoatCruiseModel> _allBoatCruises = <BoatCruiseModel>[].obs;

  RxList<ShortletModel> get allShortlets => _allShortlets;
  RxList<CarRentalModel> get allCarRentals => _allCarRentals;
  RxList<BoatCruiseModel> get allBoatCruises => _allBoatCruises;

  @override
  void onInit() {
    super.onInit();
    _fetchAllShortlets();
    _fetchAllCarRentals();
    _fetchAllBoatCruises();
  }

  //methods
  void updateBasedOnStay() {
    isStaySelected.value = true;
    isCarRentalSelected.value = false;
    isBoatCruiseSelected.value = false;

    if (isStaySelected.value) {
      stayBorderColor.value = AppColors.appMainColor;
      carRentalBorderColor.value = Colors.grey.shade200;
      boatCruiseBorderColor.value = Colors.grey.shade200;

      stayTextAndIconColor.value = AppColors.appMainColor;
      carRentalTextAndIconColor.value = AppColors.appTextFadedColor;
      boatCruiseTextAndIconColor.value = AppColors.appTextFadedColor;

      stayFontWeight.value = FontWeight.bold;
      carRentalFontWeight.value = FontWeight.normal;
      boatCruiseFontWeight.value = FontWeight.normal;
    }
  }

  void updateBasedOnRentBoats() {
    isStaySelected.value = false;
    isCarRentalSelected.value = false;
    isBoatCruiseSelected.value = true;

    if (isBoatCruiseSelected.value) {
      boatCruiseBorderColor.value = AppColors.appMainColor;
      carRentalBorderColor.value = Colors.grey.shade200;
      stayBorderColor.value = Colors.grey.shade200;

      boatCruiseTextAndIconColor.value = AppColors.appMainColor;
      carRentalTextAndIconColor.value = AppColors.appTextFadedColor;
      stayTextAndIconColor.value = AppColors.appTextFadedColor;

      stayFontWeight.value = FontWeight.normal;
      carRentalFontWeight.value = FontWeight.normal;
      boatCruiseFontWeight.value = FontWeight.bold;
    }
  }

  void updateBasedOnRentCars() {
    isStaySelected.value = false;
    isCarRentalSelected.value = true;
    isBoatCruiseSelected.value = false;

    if (isCarRentalSelected.value) {
      carRentalBorderColor.value = AppColors.appMainColor;
      stayBorderColor.value = Colors.grey.shade200;
      boatCruiseBorderColor.value = Colors.grey.shade200;

      carRentalTextAndIconColor.value = AppColors.appMainColor;
      stayTextAndIconColor.value = AppColors.appTextFadedColor;
      boatCruiseTextAndIconColor.value = AppColors.appTextFadedColor;

      stayFontWeight.value = FontWeight.normal;
      carRentalFontWeight.value = FontWeight.bold;
      boatCruiseFontWeight.value = FontWeight.normal;
    }
  }

  void updateShortletLocationTab(String newLocation) {
    defaultShortletLocation.value = newLocation;
    //.when it changes it filters the shortlets based on those tabs
    _allShortlets
        .where((sh) => sh.address.state.toLowerCase() == newLocation)
        .toList();
  }

  void updateCarRentalLocationTab(String newLocation) {
    defaultCarRentalLocation.value = newLocation;
    //.when it changes it filters the car rental based on those tabs
  }

  void updateBoatCruiseLocationTab(String newLocation) {
    defaultBoatCruiseLocation.value = newLocation;
    //.when it changes it filters the boatcruise based on those tabs
  }

  void _fetchAllShortlets() async {
    try {
      areShortletsLoading.value = true;
      final fetchedShortlets = await shorletRepository.fetchAllShorlets();
      _allShortlets.assignAll(fetchedShortlets);
    } catch (e) {
      AppDebugger.debugger(e);
    } finally {
      areShortletsLoading.value = false;
    }
  }

  void _fetchAllCarRentals() async {
    try {
      areCarRentalsLoading.value = true;
      final fetchedCarRentals = await carRentalRepository.fetchAllCarRentals();
      _allCarRentals.assignAll(fetchedCarRentals);
    } catch (e) {
      AppDebugger.debugger(e);
    } finally {
      areCarRentalsLoading.value = false;
    }
  }

  void _fetchAllBoatCruises() async {
    try {
      areBoatCruiseLoading.value = true;
      final fetchedBoatCruises =
          await boatCruiseRepository.fetchAllBoatCruise();
      _allBoatCruises.assignAll(fetchedBoatCruises);
    } catch (e) {
      AppDebugger.debugger(e);
    } finally {
      areBoatCruiseLoading.value = false;
    }
  }
}
