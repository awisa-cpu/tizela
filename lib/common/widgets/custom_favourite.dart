import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomFavourite extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  const CustomFavourite({
    super.key,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Image.asset(
          ImagesText.heartIcon,
          color: Colors.white,
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
