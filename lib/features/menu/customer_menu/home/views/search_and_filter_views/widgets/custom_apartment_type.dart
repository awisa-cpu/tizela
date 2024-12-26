import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/features/menu/customer_menu/home/model/apartment_type_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import 'custom_filter_tab.dart';

class CustomApartmentType extends StatelessWidget {
  final ApartmentTypeModel apartmentType;
  final bool apartmentImageSelected;
  final VoidCallback onTap;
  const CustomApartmentType({
    super.key,
    required this.apartmentType,
    required this.apartmentImageSelected, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilterTab(
      onTap: onTap,
      width: 150,
      height: 60,
      borderRadius: 10,
      borderColor: apartmentImageSelected
          ? AppColors.appMainColor
          : Colors.grey.withValues(alpha: 0.5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(apartmentType.imageIcon),
          const CustomWidth(width: 5),
          Text(
            apartmentType.name,
            style: customTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.appTextFadedColor,
            ),
          )
        ],
      ),
    );
  }
}
