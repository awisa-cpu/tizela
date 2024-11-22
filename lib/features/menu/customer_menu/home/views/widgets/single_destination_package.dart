import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/model/destination_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class SingleDestinationPackage extends StatelessWidget {
  const SingleDestinationPackage({
    super.key,
    required this.destinationItem,
  });

  final DestinationModel destinationItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            destinationItem.imageUrl,
            height: 190,
            width: 160,
            fit: BoxFit.contain,
          ),
        ),
        const CustomHeight(height: 3),
        Text(
          destinationItem.destinationName,
          style: customTextStyle(fontSize: 14),
        ),
        Text(
          destinationItem.location,
          style: customTextStyle(
            fontSize: 12,
            color: AppColors.appTextFadedColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
