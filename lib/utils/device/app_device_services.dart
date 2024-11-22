import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class AppDeviceServices {
  static void updateSystemOverLayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.appWhiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.bottom],
    );
  }

  static void restoreStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  static double getAppBarHeight(BuildContext context) => kToolbarHeight;

  static String getImageName({required File imageFile, int index = 7}) =>
      imageFile.path.split('/').elementAt(index).trim();

  static Future<String> getFileSize({required File file}) async {
    try {
      final int fileSizeInBytes = await file.length();
      if (fileSizeInBytes < 0) {
        return "0";
      }
      //1 kilo = 1024 byte : 1mb = 1024 kilo
      var valueInKiloBytes = fileSizeInBytes / 1024;

      return valueInKiloBytes.toStringAsFixed(2);
    } catch (e) {
      rethrow;
    }
  }
}
