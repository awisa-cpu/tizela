import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../widgets/custom_reviews.dart';

class CustomBoatCruiseDetailsFirstSection extends StatelessWidget {
  const CustomBoatCruiseDetailsFirstSection({
    super.key,
    required this.boatCruiseItem,
  });

  final BoatCruiseModel boatCruiseItem;

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              boatCruiseItem.name,
              style: customTextStyle(
                fontSize: 16,
              ),
            ),
            CustomReviews(
              reviewCount: boatCruiseItem.ratingsCount,
            ),
          ],
        ),

        //
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //todo: passenger count
              Text(
                "18 passengers",
                style: customTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appTextFadedColor,
                ),
              ),
          
              //cost
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${boatCruiseItem.boatFee.round()}",
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
        ),
      ],
    );
  }
}
