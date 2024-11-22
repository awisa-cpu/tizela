import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_without_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class SingleCarRentalPackage extends StatelessWidget {
  const SingleCarRentalPackage({
    super.key,
    required this.carRental,
    this.onTap,
  });

  final CarRentalModelxxxxxxxxxxx carRental;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section 1
          Stack(
            children: [
              CustomDisplayClipImageWithoutSize(imageUrl: carRental.imageUrl),
              Positioned(
                right: 10,
                top: 10,
                child: CustomFavourite(
                  onTap: () {},
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CustomIconAndText(
                  imageIcon: ImagesText.galleryIcon,
                  text: carRental.imagesCount.toString(),
                  textStyle: const TextStyle(color: Colors.white),
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
          const CustomHeight(height: 5),

          //section 2
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //name and rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    carRental.name,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const CustomReviews(reviewCount: 4.8),
                ],
              ),

              //attributes
              const CustomHeight(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconAndText(
                    imageIcon: ImagesText.userIcon,
                    text: "4",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  CustomIconAndText(
                    imageIcon: ImagesText.holidayBagIcon,
                    text: "2",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomWidth(width: 5),
                  CustomIconAndText(
                    imageIcon: ImagesText.acIcon,
                    text: "AC",
                    color: AppColors.appIconColorBox,
                    textStyle: customTextStyle(
                      fontSize: 14,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const CustomHeight(height: 5),

              //cost
              CustomDisplayCost(cost: carRental.cost, perWhat: "12 hrs")
            ],
          )
        ],
      ),
    );
  }
}
