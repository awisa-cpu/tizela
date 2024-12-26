import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_without_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';

class SingleCarRental extends StatelessWidget {
  const SingleCarRental({
    super.key,
    required this.carRental,
    this.onTap,
  });

  final CarRentalModel carRental;
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
              CustomDisplayClipImageWithoutSize(
                imageUrl: carRental.carImages.first,
              ),
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
                  text: carRental.carImages.length.toString(),
                ),
              )
            ],
          ),
          const CustomHeight(height: 15),

          //section 2:details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //name and rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    carRental.carName,
                    style: customTextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  CustomReviews(
                    reviewCount: carRental.ratingsCount,
                  ),
                ],
              ),

              //attributes
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: 
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children: carRental.carRentalDetails.map(
                      (attribute) {
                        return CustomIconAndText(
                          text: attribute.detailCount.value.toString(),
                          iconImage:
                             AppFunctions. getIconImageByAttributeName(attribute.name),
                          color: AppColors.appIconColorBox,
                          textStyle: customTextStyle(
                            fontSize: 14,
                            color: AppColors.appTextFadedColor,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ).toList()),
              ),

              //cost
              CustomDisplayCost(
                cost: carRental.carPrice.round().toString(),
                costFontWeight: FontWeight.bold,
                perWhat: "12 hrs",
              )
            ],
          )
        ],
      ),
    );
  }

 
}
