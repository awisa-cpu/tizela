import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shortlet_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../common/widgets/custom_display_clip_image_without_size.dart';
import '../../../../../../utils/constants/images_texts.dart';
import '../../../favourite/controller/customer_shortlet_favourite_controller.dart';

class SingleShortlet extends StatelessWidget {
  const SingleShortlet({
    super.key,
    required this.shortlet,
    this.onTap,
  });

  final ShortletModel shortlet;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final CustomShortletFavouriteController controller =
        CustomShortletFavouriteController.instance;

    //
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section 1:images
          Stack(
            children: [
              CustomDisplayClipImageWithoutSize(
                imageUrl: shortlet.apartmentImages.first,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Obx(
                  () => CustomFavourite(
                    onTap: () => controller.addOrRemoveFromShortletFavourites(
                      shortletId: shortlet.uid!,
                    ),
                    color:
                        controller.isAdded(shortlet.uid!) ? Colors.red : null,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CustomIconAndText(
                  text: "${shortlet.apartmentImages.length}",
                ),
              )
            ],
          ),
          const CustomHeight(height: 15),

          //details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shortlet.apartmentName,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  CustomReviews(
                    reviewCount: shortlet.ratingsCount,
                  )
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  shortlet.apartmentType.name,
                  style: customTextStyle(
                    fontSize: 13,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImagesText.currentLocationIcon),
                    Text(
                      "${shortlet.address.state} state",
                      style: customTextStyle(
                          fontSize: 12,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),

              //cost
              CustomDisplayCost(
                cost: shortlet.apartmentPrice.toString(),
                costFontWeight: FontWeight.bold,
                perWhat: "per night",
              ),
            ],
          )
        ],
      ),
    );
  }
}
