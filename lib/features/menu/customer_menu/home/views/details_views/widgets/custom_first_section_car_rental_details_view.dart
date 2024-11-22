import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomFirstSectionCarRentalDetailsView extends StatelessWidget {
  const CustomFirstSectionCarRentalDetailsView({
    super.key,
    required this.carRental,
  });

  final CarRentalModelxxxxxxxxxxx carRental;

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomFilterTab(
          text: "Luxury",
          height: 50,
          width: 80,
          textColor: AppColors.appWhiteColor,
          color: AppColors.appMainColor,
          alignment: Alignment.topCenter,
        ),
        const CustomHeight(height: 15),
        //name and rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              carRental.name,
              style: customTextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.orange.withOpacity(0.6),
                ),
                Text(
                  "4.8",
                  style: customTextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),

        //attributes
        const CustomHeight(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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

            //cost
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "#${carRental.cost}",
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
