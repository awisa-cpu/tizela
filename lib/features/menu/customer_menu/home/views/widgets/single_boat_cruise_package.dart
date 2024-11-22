import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_without_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class SingleBoatCruisePackage extends StatelessWidget {
  const SingleBoatCruisePackage({
    super.key,
    required this.boatCruse,
    this.onTap,
  });

  final BoatCruiseModelxxxxxxxx boatCruse;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section 1: image and its details
          Stack(
            children: [
              CustomDisplayClipImageWithoutSize(imageUrl: boatCruse.imageUrl),
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
                  text: boatCruse.imagesCount.toString(),
                  textStyle: const TextStyle(color: Colors.white),
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
          const CustomHeight(height: 5),

          //section 2: details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //name and rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    boatCruse.name,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const CustomReviews(reviewCount: 4.8)
                ],
              ),

              //attributes
              const CustomHeight(height: 5),
              Text(
                boatCruse.passengerRange,
                style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const CustomHeight(height: 5),

              //cost
              CustomDisplayCost(cost: boatCruse.cost, perWhat: "per hr")
            ],
          )
        ],
      ),
    );
  }
}
