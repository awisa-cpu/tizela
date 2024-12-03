import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/services/alert_services.dart';
import '../../../data/services/media_service.dart';
import '../../../features/menu/host_menu/listings/model/apartment_house_rules_model.dart';
import '../../../features/menu/host_menu/listings/model/app_file_model.dart';
import '../../../features/menu/host_menu/listings/model/car_brand_model.dart';
import '../../constants/app_colors.dart';
import '../../formatters/app_date_formatter.dart';
import '../app_debugger/app_debugger.dart';
import '../app_device_services/app_device_services.dart';

class AppFunctions {
  static double getPriceFromController(TextEditingController controller) {
    final price = double.tryParse(controller.text.trim());

    if (price != null) {
      return price;
    }

    return 0.0;
  }

//car rental
  static void onUpdateCarTypeSelected(
          {required String carType, required RxString selectedCarType}) =>
      selectedCarType.value = carType;

  static void onUpdateCarBrandSelected(
          {required CarBrandModel carBrand,
          required Rx<CarBrandModel> selectedCarBrand}) =>
      selectedCarBrand.value = carBrand;

  static void onCarYearChanged(
      {required dynamic newValue, required RxString currentCarYear}) {
    if (newValue != null) {
      currentCarYear.value = newValue;
    }
  }

//general
  static onCurrentPageIndexChanged(
          {required int newPageIndex,
          required RxInt currentSelectedPageIndex}) =>
      currentSelectedPageIndex.value = newPageIndex;

  static void diplayEditSheet(
      {required BuildContext context, required Widget child}) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) => child,
    );
  }

  static void selectImages(
      {required RxList<AppFileModel> selectedImages}) async {
    try {
      final imageFile =
          await MediaServiceController.instance.pickImageFromGallery();
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

  static void deleteImageFromList({
    required RxList<AppFileModel> selectedImages,
    required AppFileModel imageFile,
  }) =>
      selectedImages.remove(imageFile);

  static Future<List<String>> uploadSelectedImagesToCloud({
    required String uid,
    required RxList<AppFileModel> selectedImages,
  }) async {
    List<File> images = selectedImages.map((file) => file.file).toList();
    List<String> uploadedImages = [];

    //
    for (final imageFile in images) {
      final String? downloadUrl =
          await MediaServiceController.instance.uploadUsersData(
        currentUid: uid,
        imageFile: imageFile,
      );

      if (downloadUrl != null) {
        uploadedImages.add(downloadUrl);
      }
    }
    return uploadedImages;
  }

  static void updateCheckboxValue({
    required bool? newValue,
    required RxBool oldValue,
  }) =>
      oldValue.value = newValue ?? false;

  static void updateCheckboxStringValue({
    required String? newValue,
    required RxString oldValue,
  }) {
    if (newValue != null) {
      oldValue.value = newValue;
    }
  }

  static void onDateInDateSelected(DateTime date, DateTime selectedDay,
          {required Rx<DateTime> dateInFocusedDay}) =>
      dateInFocusedDay.value = date;

  static void onDateOutDateSelected(DateTime date, DateTime selectedDay,
      {required Rx<DateTime> dateOutFocusedDay}) {
    dateOutFocusedDay.value = date;
  }

  static String getDateRange({required List<DateTime> availableDates}) {
    final firstDate =
        AppDateFormater.formatDate(date: availableDates[0], format: "MMM dd");
    final secondDate =
        AppDateFormater.formatDate(date: availableDates[1], format: "MMM dd");

    // Get the day number
    int day = availableDates[0].day;
    int day2 = availableDates[1].day;

    // Determine the ordinal suffix
    String day1Suffix;
    String day2Suffix;
    if (day >= 11 && day <= 13) {
      day1Suffix = 'th'; // Special case for 11th, 12th, and 13th
    } else {
      switch (day % 10) {
        case 1:
          day1Suffix = 'st';
          break;
        case 2:
          day1Suffix = 'nd';
          break;
        case 3:
          day1Suffix = 'rd';
          break;
        default:
          day1Suffix = 'th';
      }
    }

    if (day2 >= 11 && day2 <= 13) {
      day2Suffix = 'th'; // Special case for 11th, 12th, and 13th
    } else {
      switch (day2 % 10) {
        case 1:
          day2Suffix = 'st';
          break;
        case 2:
          day2Suffix = 'nd';
          break;
        case 3:
          day2Suffix = 'rd';
          break;
        default:
          day2Suffix = 'th';
      }
    }
    return "$firstDate$day1Suffix - $secondDate$day2Suffix";
  }

  static void incrementCount(RxInt itemCount) {
    if (itemCount.value != 20) {
      itemCount.value++;
    }
  }

  static void decrementCount(RxInt itemCount) {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }

  static void onFirstHouseRuleChanged({
    required ApartmentHouseRulesModel houseRule,
  }) {
    houseRule.isFirstValue.value = true;
    houseRule.isSecondValue.value = false;
    houseRule.isActive.value = true;
  }

  static void onSecondHouseRuleChanged({
    required ApartmentHouseRulesModel houseRule,
  }) {
    houseRule.isFirstValue.value = false;
    houseRule.isSecondValue.value = true;
    houseRule.isActive.value = false;
  }

  static String getCurrency() {
    var format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
    );
    return format.currencySymbol;
  }
}
