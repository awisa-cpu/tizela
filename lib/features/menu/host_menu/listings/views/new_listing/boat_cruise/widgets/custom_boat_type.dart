import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../model/boat_type_model.dart';

class CustomBoatType extends StatelessWidget {
  final BoatTypeModel boatType;
  final VoidCallback onTap;
  final bool isBoatSelected;
  const CustomBoatType(
      {super.key,
      required this.boatType,
      required this.onTap,
      required this.isBoatSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedEdgedContainer(
        borderRadius: 10,
        alignment: Alignment.center,
        borderColor: isBoatSelected
            ? AppColors.appMainColor
            : Colors.grey.withValues(alpha: 0.5),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              boatType.imageUrl,
              height: 50,
              width: 50,
            ),
            Text(
              boatType.boatName,
              style: customTextStyle(
                fontSize: 13,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
