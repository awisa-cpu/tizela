import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomReviews extends StatelessWidget {
  final bool shouldShowReviewText;
  final double reviewCount;
  const CustomReviews({
    super.key,
    this.shouldShowReviewText = false,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star_rounded,
          color: Color(0xFFFFD33C),
          size: 18,
        ),
        Text(
          reviewCount.toString(),
          style: customTextStyle(
            fontSize: 12,
          ),
        ),
        const CustomWidth(width: 5),
        if (shouldShowReviewText)
          Text(
            "Reviews",
            style: customTextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.appMainColor,
                fontWeight: FontWeight.normal),
          )
      ],
    );
  }
}
