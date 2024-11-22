import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/setup/app_navigator.dart';

class CustomFilterHeader extends StatelessWidget {
  const CustomFilterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Filters",
          style: customTextStyle(
            fontSize: 14,
          ),
        ),
        IconButton(
          onPressed: () => AppNagivator.goBack(context),
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}
