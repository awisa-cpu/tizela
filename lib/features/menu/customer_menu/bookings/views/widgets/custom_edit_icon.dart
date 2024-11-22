import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomEditIcon extends StatelessWidget {
  final VoidCallback onTap;
  const CustomEditIcon({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImagesText.blueEditPen),
          Text(
            "Edit",
            style: customTextStyle(
              fontSize: 14,
              color: AppColors.appMainColor,
            ),
          )
        ],
      ),
    );
  }
}
