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
      return results.any((status) =>
          status == ConnectivityResult.none ||
          status == ConnectivityResult.bluetooth);
    } on PlatformException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  void _updateInternetStatus(List<ConnectivityResult> connectivityResults) {
    final ans = connectivityResults.any((result) =>
        result == ConnectivityResult.bluetooth ||
        result == ConnectivityResult.none);
    if (ans) {
      AlertServices.errorSnackBar(title: "Oh snap!", message: "No internet");
    }
  }

  @override
  void onClose() {
    super.onClose();
    connectivityStatusSubscription.cancel();
  }
}
