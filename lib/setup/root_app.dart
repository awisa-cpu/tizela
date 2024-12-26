import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/bindings/general_bindings.dart';
import 'package:tizela/setup/app_loader.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/theme/app_theme.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: AppNagivator.navigatorKey,
      title: 'Tizela',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      routes: AppNagivator.routes(),
      home: const AppLoader(),
    );
  }
}
