import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/bindings/general_bindings.dart';
import 'package:tizela/setup/app_loader.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/data/services/theme_service/app_theme_controller.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(AppThemeController());

    //
    return Obx(
      () => GetMaterialApp(
        navigatorKey: AppNagivator.navigatorKey,
        title: 'Tizela',
        debugShowCheckedModeBanner: false,
        theme: themeController.lightTheme,
        darkTheme: themeController.darkTheme,
        themeMode: themeController.themeMode.value,
        initialBinding: GeneralBindings(),
        routes: AppNagivator.routes(),
        home: const AppLoader(),
      ),
    );
  }
}

