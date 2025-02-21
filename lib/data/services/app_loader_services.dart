import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class AppLoaderService {
  static void startLoader({required String loaderText}) async {
    await showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Material(
          child: Container(
            color: AppColors.appWhiteColor,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SpinKitFadingCircle(
                  color: AppColors.appMainColor,
                  size: 60,
                  duration: Duration(milliseconds: 1500),
                ),
                const CustomHeight(
                  height: 45,
                ),
                Text(
                  loaderText,
                  style: customTextStyle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showOverlayLoader({required String loaderText}) async {
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (_) {
        return PopScope(
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: Get.context!.screenHeight() * 0.50,
                width: Get.context!.screenWidth() * 0.80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SpinKitFadingCircle(
                      color: AppColors.appMainColor,
                      size: 60,
                      duration: Duration(milliseconds: 1500),
                    ),
                    const CustomHeight(
                      height: 45,
                    ),
                    Text(
                      loaderText,
                      style: customTextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void stopLoader() {
    Navigator.pop(Get.overlayContext!);
  }
}
