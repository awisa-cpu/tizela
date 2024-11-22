import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/customer_menu/home/model/holiday_service_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSeeMoreItem extends StatelessWidget {
  const CustomSeeMoreItem({
    super.key,
    required this.serviceItem,
  });

  final ServiceTypeModel serviceItem;

  @override
  Widget build(BuildContext context) {
    return 
    
    CustomRoundedEdgedContainer(
      borderRadius: 10,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            serviceItem.iconImage,
            height: 50,
            width: 50,
          ),
          const CustomHeight(height: 5),
          Text(
            serviceItem.name,
            style: customTextStyle(
              fontSize: 13,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
