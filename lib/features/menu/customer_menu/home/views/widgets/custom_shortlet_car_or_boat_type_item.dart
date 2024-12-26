import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomShortletCarOrBoatTypeItem extends StatelessWidget {
  const CustomShortletCarOrBoatTypeItem({
    super.key,
    required this.itemIcon,
    required this.itemName,
  });

  final String itemIcon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomRoundedEdgedContainer(
          borderRadius: 200,
          child: Image.asset(
            itemIcon,
            height: 30,
            width: 30,
          ),
        ),
        const CustomHeight(height: 10),
        Text(
          itemName,
          style: customTextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12,
            color: AppColors.appTextFadedColor,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
