import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/model/reviews_model.dart';
import 'custom_review_tab.dart';

class ReviewsPanel extends StatelessWidget {
  final double reviewCount;
  const ReviewsPanel({super.key, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: reviewCount.toInt()==0? 3:reviewCount.toInt(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final ReviewsModel review = LocalDatabase.reviews.take(reviewCount.toInt()==0? 3: reviewCount.toInt()).elementAt(index);

          return CustomReviewTab(review: review);
        },
        separatorBuilder: (_, __) => const CustomWidth(width: 15),
      ),
    );
  }
}
