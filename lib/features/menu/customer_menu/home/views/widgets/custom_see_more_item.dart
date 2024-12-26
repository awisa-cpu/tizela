import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSeeMoreItem extends StatelessWidget {
  const CustomSeeMoreItem({
    super.key,
    required this.imageUrl,
    required this.name,
    this.imageHeight,
    this.imageWidth, this.crossAxisAlignment,
  });

  final String imageUrl, name;
  final double? imageHeight, imageWidth;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      borderRadius: 5,
      borderColor: Colors.grey.withValues(alpha: 0.3),
      paddingNumber: 15,
      alignment: Alignment.center,
      child: CustomColumn(
        crossAxisAlignment: crossAxisAlignment?? CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: imageHeight ?? 40,
            width: imageWidth ?? 40,
            fit: BoxFit.cover,
          ),
          const CustomHeight(
            height: 12,
          ),
          Text(
            name,
            style: customTextStyle(
              fontSize: 13,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
