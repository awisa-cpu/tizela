import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppFunctions {
  static double getPriceFromController(TextEditingController controller) {
    final price = double.tryParse(controller.text.trim());

    if (price != null) {
      return price;
    }

    return 0.0;
  }

  static void diplayEditSheet(
      {required BuildContext context, required Widget child}) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) => child,
    );
  }
}
