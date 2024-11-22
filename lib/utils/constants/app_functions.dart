import 'package:flutter/material.dart';

import 'app_colors.dart';

void diplayEditSheet({ required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    backgroundColor: AppColors.appWhiteColor,
    isDismissible: false,
    context: context,
    builder: (context) => child,
  );
}
