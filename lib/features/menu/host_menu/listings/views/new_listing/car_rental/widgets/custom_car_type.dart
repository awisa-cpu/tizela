import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_tab.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomCarType extends StatelessWidget {
  final String carType;
  final VoidCallback onTap;
  final bool isCarTypeSelected;
  const CustomCarType(
      {super.key,
      required this.carType,
      required this.onTap,
      required this.isCarTypeSelected});

  @override
  Widget build(BuildContext context) {
    return CustomFilterTab(
        onTap: onTap,
        width: 150,
        height: 60,
        borderRadius: 10,
        borderColor: isCarTypeSelected
            ? AppColors.appMainColor
            : Colors.grey.withOpacity(0.5),
        child: Text(
          carType,
          style: customTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.appTextFadedColor,
          ),
        ));
  }
}
