import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/success_view.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => AppNagivator.goBack(),
                  icon: const Icon(Icons.close))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Leave a Review",
                style: customTextStyle(fontSize: 16),
              )
            ],
          ),
          const CustomHeight(height: 10),
          const CustomDivider(),
          const CustomHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How was your experience at\n Sunderam boys PG?",
                textAlign: TextAlign.center,
                style: customTextStyle(),
              ),
            ],
          ),
          const CustomHeight(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const CustomDivider(),
          const CustomHeight(height: 10),
          Text(
            "Write your review",
            style: customTextStyle(),
          ),
          const CustomHeight(height: 10),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Type review here...",
              hintStyle: customTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.appTextFadedColor,
              ),
            ),
          ),
          const CustomHeight(height: 15),
          CustomEleButton(
            onPressed: () => AppNagivator.pushRoute(
              const SuccessView(
                  mainText: "Review submitted!",
                  subText:
                      "Thank you for leaving a review which helps us improve your experience on the platform"),
            ),
            text: "Save",
          )
        ],
      ),
    );
  }
}
