import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomShare extends StatelessWidget {
  final VoidCallback onTap;
  const CustomShare({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.appWhiteColor,
          ),
          child: Image.asset(
            ImagesText.shareIcon,
            height: 40,
            width: 40,
          )),
    );
  }
}
