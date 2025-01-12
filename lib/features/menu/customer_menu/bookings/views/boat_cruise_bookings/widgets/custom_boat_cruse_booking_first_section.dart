import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomBoatCruseBookingFirstSection extends StatelessWidget {
  const CustomBoatCruseBookingFirstSection({
    super.key,
    required this.boatCruise,
  });

  final BoatCruiseModel boatCruise;

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
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(
              networkImageUrl: boatCruise.boatImages.first,
              imageWidth: 110,
              imageHeigth: 100,
              fit: BoxFit.cover,
            ),
          ),
          const CustomWidth(width: 10),

          //details
          CustomColumn(
            children: [
              //
              Text(
                boatCruise.name,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "${boatCruise.boatCruiseDetails.last.detailCount.value <= 0 ? 0 : boatCruise.boatCruiseDetails.last.detailCount.value} passengers",
                  style: customTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor,
                  ),
                ),
              ),

              //cost
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${boatCruise.boatFee.round()}",
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
