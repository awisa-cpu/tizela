import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../host_menu/listings/model/car_rental_model.dart';
import '../../widgets/custom_reviews.dart';

class CustomFirstSectionCarRentalDetailsView extends StatelessWidget {
  const CustomFirstSectionCarRentalDetailsView({
    super.key,
    required this.carRental,
  });

  final CarRentalModel carRental;

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomFilterTab(
          text: "Luxury",
          height: 50,
          width: 90,
          textColor: AppColors.appWhiteColor,
          color: AppColors.appMainColor,
          alignment: Alignment.center,
          fontSize: 12,
        ),
        //name and rating
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                carRental.carName,
                style: customTextStyle(
                  fontSize: 16,
                ),
              ),
              CustomReviews(
                reviewCount: carRental.ratingsCount,
              ),
            ],
          ),
        ),

        //attributes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 7,
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
              ).toList(),
            ),

            //cost
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "#${carRental.carPrice.round()}",
                    style: customTextStyle(
                      color: AppColors.appMainColor,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: " / hr",
                    style: customTextStyle(
                        color: AppColors.appMainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
