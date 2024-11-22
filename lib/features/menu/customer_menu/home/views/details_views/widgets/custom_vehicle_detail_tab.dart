import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomVehicleOrBoatDetailTab extends StatelessWidget {
  final String attribute, attributeValue;
  const CustomVehicleOrBoatDetailTab({
    super.key,
    required this.attribute,
    required this.attributeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomRoundedEdgedContainer(
        borderRadius: 5,
        showBorder: false,
        width: context.screenWidth(),
        color: AppColors.appColorBox,
        child: CustomColumn(
          children: [
            Text(
              attribute,
              style: customTextStyle(
                  fontSize: 12, color: AppColors.appTextFadedColor),
            ),
            Text(
              attributeValue,
              style: customTextStyle(
                fontSize: 12,
                color: AppColors.appTextFadedColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
