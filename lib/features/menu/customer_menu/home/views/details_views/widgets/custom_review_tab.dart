import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/customer_menu/home/model/reviews_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomReviewTab extends StatelessWidget {
  const CustomReviewTab({
    super.key,
    required this.review,
  });

  final ReviewsModel review;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: context.screenWidth() * 0.34,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.22),
          spreadRadius: 4.0,
          blurRadius: 7.0,
          offset: const Offset(2, 1),
        )
      ],
      child: CustomColumn(
        children: [
          Text(
            review.reviewerName,
            style: customTextStyle(),
          ),
          const CustomHeight(height: 10),
          RatingBarIndicator(
            rating: review.rating,
            unratedColor: AppColors.appTextFadedColor,
            itemBuilder: (context, index) => Icon(
              Icons.star_rounded,
              color: Colors.orange.withValues(alpha: 0.6),
            ),
            itemCount: 5,
            itemSize: 30.0,
            direction: Axis.horizontal,
          ),
          const CustomHeight(height: 10),
          Expanded(
            child: Text(
              review.reviewText,
              style: customTextStyle(
                  fontSize: 12, color: AppColors.appTextFadedColor),
            ),
          )
        ],
      ),
    );
  }
}
