import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomPackageService extends StatelessWidget {
  final String icon, title;
  final Color borderColor, textAndIconColor;
  final FontWeight fontWeight;
  final VoidCallback onTap;
  const CustomPackageService({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.borderColor,
    required this.textAndIconColor,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRoundedEdgedContainer(
            borderColor: borderColor,
            borderRadius: 10,
            child: Image.asset(
              icon,
              color: textAndIconColor,
            ),
          ),
          const CustomHeight(height: 10),
          Text(
            title,
            style: customTextStyle(
              color: textAndIconColor,
              fontWeight: fontWeight,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
