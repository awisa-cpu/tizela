import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShortletFilterMinOrMaxPriceTab extends StatelessWidget {
  final String price;
  const CustomShortletFilterMinOrMaxPriceTab({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withValues(alpha: 0.4)),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.appWhiteColor),
      child: Text(
        price,
        style: customTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
