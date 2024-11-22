import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../common/widgets/custom_display_clip_image_without_size.dart';

class SingleShortletPackage extends StatelessWidget {
  const SingleShortletPackage({
    super.key,
    required this.shortlet,
    this.onTap,
  });

  final ShortletModelxxxxxxxxxxxxxxxx shortlet;
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
              CustomDisplayClipImageWithoutSize(imageUrl: shortlet.imageUrl),
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
                  text: "${shortlet.imagesCount}",
                  textStyle: const TextStyle(color: Colors.white),
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
          const CustomHeight(height: 5),

          //details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shortlet.name,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const CustomReviews(
                    reviewCount: 4.8,
                  )
                ],
              ),
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
                  const Icon(Icons.location_on_outlined),
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

              //cost

              CustomDisplayCost(cost: shortlet.cost, perWhat: "per night"),
            ],
          )
        ],
      ),
    );
  }
}
