import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSelectableLocationTabItem extends StatelessWidget {
  const CustomSelectableLocationTabItem({
    super.key,
    required this.isSelected,
    required this.location,
    required this.onTabSelected,
    this.height = 40,
    this.width = 85,
    this.alignment = Alignment.center,
    this.overflow,
  });

  final bool isSelected;
  final String location;
  final double? height, width;
  final Alignment? alignment;
  final TextOverflow? overflow;
  final VoidCallback onTabSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabSelected,
      child: CustomRoundedEdgedContainer(
        color: isSelected ? AppColors.appMainColor : AppColors.appWhiteColor,
        alignment: alignment,
        height: height,
        width: width,
        borderRadius: 25,
        paddingNumber: 10,
        child: Text(
          location,
          style: customTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: isSelected
                ? AppColors.appWhiteColor
                : AppColors.appTextFadedColor,
            overflow: overflow,
          ),
        ),
      ),
    );
  }
}
