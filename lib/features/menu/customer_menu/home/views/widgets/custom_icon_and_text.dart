import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomIconAndText extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final TextStyle? textStyle;
  final String? iconImage;
  const CustomIconAndText({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.textStyle,
    this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 70,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: color ?? Colors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconImage ?? ImagesText.galleryIcon,
            ),
            const CustomWidth(width: 5),
            Text(
              text,
              style: textStyle ?? const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
