import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSliderIndicator extends StatelessWidget {
  final int initialValue;
  final int currentPageIndex;
  const CustomSliderIndicator({
    super.key,
    required this.initialValue,
    required this.currentPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 5,
      width: 40,
      decoration: BoxDecoration(
        color: initialValue == currentPageIndex
            ? AppColors.appMainColor
            : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
