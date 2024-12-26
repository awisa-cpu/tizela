import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';

class CustomCarRentalBookingsFirstSection extends StatelessWidget {
  const CustomCarRentalBookingsFirstSection({
    super.key,
    required this.carRental,
  });

  final CarRentalModel carRental;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ],
      paddingNumber: 15,
      borderRadius: 12,
      child: Row(
        children: [
          //
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(
              imageUrl: carRental.carImages.first,
              imageWidth: 110,
              imageHeigth: 100,
              fit: BoxFit.cover,
            ),
          ),
          const CustomWidth(width: 10),

          //
          CustomColumn(
            children: [
              //name
              Text(
                carRental.carName,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
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
              ),

              //cost
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${carRental.carPrice}",
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
          )
        ],
      ),
    );
  }
}
