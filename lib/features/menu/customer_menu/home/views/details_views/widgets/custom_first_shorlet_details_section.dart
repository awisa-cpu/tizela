import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shortlet_attributes.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../host_menu/listings/model/shorlet_model.dart';

class CustomFirstShortletDetailsSection extends StatelessWidget {
  final ShortletModel shortletItem;
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
          shortletItem.apartmentName,
          style: customTextStyle(
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            shortletItem.apartmentType.name,
            style: customTextStyle(
              fontSize: 12,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),

        //
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImagesText.currentLocationIcon,
            ),
            const CustomWidth(width: 5),
            Text(
              "${shortletItem.address.state} state",
              style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),

        //reviews
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CustomReviews(
            shouldShowReviewText: true,
            reviewCount: shortletItem.ratingsCount,
          ),
        ),

        //attributes
        CustomShortletAttributes(
          shortlet: shortletItem,
        ),
        const CustomHeight(height: 10),
      ],
    );
  }
}
