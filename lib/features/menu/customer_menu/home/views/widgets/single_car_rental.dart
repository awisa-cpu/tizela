import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_without_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_favourite.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_reviews.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../host_menu/listings/model/car_rental_model.dart';
import '../../../favourite/controller/custom_car_rental_favourite_controller.dart';

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
    final favController = CustomCarRentalFavouriteController.instance;

    //
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section 1
          Stack(
            children: [
              CustomDisplayClipImageWithoutSize(
                imageUrl: carRental.carImages.first,
              ),
              //favourite
              Positioned(
                right: 10,
                top: 10,
                child: Obx(
                  () => CustomFavourite(
                    onTap: () =>
                        favController.addOrRemoveFromCarRentalFavourites(
                            carRentalId: carRental.uid!),
                    color: favController.isAdded(carRentalId: carRental.uid!)
                        ? Colors.red
                        : null,
                  ),
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
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: carRental.carRentalDetails.map(
                      (attribute) {
                        return CustomIconAndText(
                          text: attribute.detailCount.value.toString(),
                          iconImage: AppFunctions.getIconImageByAttributeName(
                              attribute.name),
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
