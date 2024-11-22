import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_width.dart';

class CustomIconAndText extends StatelessWidget {
  final String imageIcon;
  final String text;
  final Color color;
  final TextStyle textStyle;
  final VoidCallback? onTap;
  const CustomIconAndText(
      {super.key,
      required this.imageIcon,
      required this.text,
      required this.color,
      required this.textStyle,
      this.onTap});

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
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageIcon,
            ),
            const CustomWidth(width: 5),
            Text(
              text,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
