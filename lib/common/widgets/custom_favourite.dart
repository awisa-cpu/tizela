import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomFavourite extends StatelessWidget {
  final VoidCallback onTap;
  const CustomFavourite({
    super.key,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appWhiteColor,
        ),
        child: Image.asset(
          ImagesText.heartIcon,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
