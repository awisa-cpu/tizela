import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomContainerBookingSummary extends StatelessWidget {
  final String target, location;
  final bool shouldExpand;
  const CustomContainerBookingSummary({
    super.key,
    required this.location,
    required this.target,
    this.shouldExpand = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          target,
          style: customTextStyle(
            fontSize: 14,
            color: AppColors.appTextFadedColor,
          ),
        ),
        const CustomWidth(width: 30),
        shouldExpand
            ? Expanded(
                child: Text(
                  location,
                  style: customTextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            : Text(
                location,
                style: customTextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
      ],
    );
  }
}
