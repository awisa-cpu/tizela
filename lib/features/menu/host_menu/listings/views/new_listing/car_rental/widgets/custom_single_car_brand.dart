import 'package:flutter/material.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_brand_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSingleCarBrand extends StatelessWidget {
  CustomSingleCarBrand({
    super.key,
    required this.brand,
    required this.isSelected,
    required this.onTap,
  });

  final CarBrandModel brand;
  bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected
                ? AppColors.appMainColor
                : Colors.grey.withOpacity(0.4),
          ),
        ),
        width: 70,
        height: 57,
        alignment: Alignment.center,
        child: Image.asset(
          brand.imageUrl,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
