import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shortlet_attributes.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomFirstShortletDetailsSection extends StatelessWidget {
  final ShortletModelxxxxxxxxxxxxxxxx shortletItem;
  const CustomFirstShortletDetailsSection({
    super.key,
    required this.shortletItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          shortletItem.name,
          style: customTextStyle(
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
        const CustomHeight(height: 5),
        Text(
          "Studio Apartment",
          style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300),
        ),
        const CustomHeight(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ImagesText.currentLocationIcon),
            const CustomWidth(width: 5),
            Text(
              "Lagos Island",
              style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        const CustomHeight(height: 5),

        //reviews
        const CustomReviews(
          shouldShowReviewText: true,
          reviewCount: 4.8,
        ),
        const CustomHeight(height: 5),

        //attributes
        const CustomShortletAttributes(),
        const CustomHeight(height: 10),
      ],
    );
  }
}
