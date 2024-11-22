import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomHostHeaderTextWithActionButton extends StatelessWidget {
  final String title, count;
  final VoidCallback onTap;
  final Widget? child;
  const CustomHostHeaderTextWithActionButton({
    super.key,
    required this.title,
    required this.count,
    required this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "$title ",
                style: customTextStyle(fontSize: 16),
              ),
              TextSpan(
                text: "($count)",
                style: customTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: child ??
              Text(
                "See all",
                style: customTextStyle(
                    fontSize: 13,
                    color: AppColors.appMainColor,
                    fontWeight: FontWeight.w600),
              ),
        )
      ],
    );
  }
}
