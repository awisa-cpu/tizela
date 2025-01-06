import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_without_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../host_menu/listings/model/boat_cruise_model.dart';
import '../../../favourite/controller/custom_boat_cruise_favourite_controller.dart';

class SingleBoatCruise extends StatelessWidget {
  const SingleBoatCruise({
    super.key,
    required this.boatCruse,
    this.onTap,
  });

  final BoatCruiseModel boatCruse;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final favCon = CustomBoatCruiseFavouriteController.instance;

    //
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section 1: image and its details
          Stack(
            children: [
              CustomDisplayClipImageWithoutSize(
                imageUrl: boatCruse.boatImages.first,
              ),

              //favourite
              Positioned(
                right: 10,
                top: 10,
                child: Obx(
                  () => CustomFavourite(
                    onTap: () => favCon.addOrRemoveFromBoatFavourites(
                        boatCruiseId: boatCruse.uid!),
                    color: favCon.isAdded(boatCruse.uid!) ? Colors.red : null,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CustomIconAndText(
                  text: boatCruse.boatImages.length.toString(),
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
                  //
                  Text(
                    boatCruse.name,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  CustomReviews(
                    reviewCount: boatCruse.ratingsCount,
                  )
                ],
              ),

              //attributes
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "passengers",
                  style: customTextStyle(
                    fontSize: 12,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

              //cost
              CustomDisplayCost(
                cost: boatCruse.boatFee.toString(),
                perWhat: "per hr",
              )
            ],
          )
        ],
      ),
    );
  }
}
