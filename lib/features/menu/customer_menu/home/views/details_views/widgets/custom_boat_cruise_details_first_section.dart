import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomBoatCruiseDetailsFirstSection extends StatelessWidget {
  const CustomBoatCruiseDetailsFirstSection({
    super.key,
    required this.boatCruiseItem,
  });

  final BoatCruiseModelxxxxxxxx boatCruiseItem;

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
        const CustomHeight(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //passenger count
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
                    text: "#${boatCruiseItem.cost}",
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
        const CustomHeight(height: 30),
      ],
    );
  }
}
