import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tizela/firebase_options.dart';
import 'package:tizela/setup/root_app.dart';

import 'data/repositories/auth_repository/auth_repository.dart';
import 'data/repositories/user_repo/app_user_repository.dart';
import 'utils/device/app_device_services.dart';

void main() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await _initGetStorage();
  await _initializeFirebase();

  _registerDependencies();
  runApp(const RootApp());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log(e.toString());
  }
}

Future<void> _initGetStorage() async {
  try {
    await GetStorage.init();
  } catch (e) {
    log(e.toString());
  }
}

void _registerDependencies() {
  try {
    Get.put(AppUserRepository());
    Get.put(AuthRepository());
    AppDeviceServices.updateSystemOverLayStyle();
  } catch (e) {
    log(e.toString());
  }
}
