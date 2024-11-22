import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomFilterTab extends StatelessWidget {
  const CustomFilterTab({
    super.key,
    this.width,
    this.height,
    this.text,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.color,
    this.marginValue,
    this.child,
    this.padding,
    this.alignment, this.onTap,
  });

  final double? borderRadius;
  final Color? textColor, borderColor, color;
  final double? width, height, marginValue, padding;
  final String? text;
  final Widget? child;
  final Alignment? alignment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginValue ?? 10.0),
        alignment: alignment ?? Alignment.center,
        width: width ?? 60,
        height: height ?? 55,
        padding: EdgeInsets.all(padding ?? 15),
        decoration: BoxDecoration(
            color: color ?? AppColors.appWhiteColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 23),
            border:
                Border.all(color: borderColor ?? Colors.grey.withOpacity(0.5))),
        child: child ??
            Text(
              text ?? '',
              style: customTextStyle(
                  color: textColor ?? AppColors.appTextFadedColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
      ),
    );
  }
}
