import 'package:flutter/material.dart';

class AppFunctions {
  static double getPriceFromController(TextEditingController controller) {
    final price = double.tryParse(controller.text.trim());

    if (price != null) {
      return price;
    }

    return 0.0;
  }
}
