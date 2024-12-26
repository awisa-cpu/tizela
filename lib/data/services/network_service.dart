import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tizela/data/services/alert_services.dart';

class NetworkServiceController extends GetxController {
  static NetworkServiceController get instance => Get.find();

  final Connectivity _internetConnectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>
      connectivityStatusSubscription;

  @override
  void onInit() {
    super.onInit();
    connectivityStatusSubscription = _internetConnectivity.onConnectivityChanged
        .listen(_updateInternetStatus);
  }

  Future<bool> isInternetConnected() async {
    try {
      final results = await _internetConnectivity.checkConnectivity();
      final response = results.any(
        (status) {
          return status == ConnectivityResult.mobile ||
              status == ConnectivityResult.wifi;
        },
      );
      return response;
    } on PlatformException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  void _updateInternetStatus(List<ConnectivityResult> connectivityResults) {
    final ans = connectivityResults.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.vpn,
    );
    if (!ans) {
      AlertServices.errorSnackBar(title: "Oh snap!", message: "No internet");
    }
  }

  @override
  void onClose() {
    super.onClose();
    connectivityStatusSubscription.cancel();
  }
}
