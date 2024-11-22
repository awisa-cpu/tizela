import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/customer_menu/home/model/holiday_service_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomHorizontalViewRoundedTabs extends StatelessWidget {
  final List<ServiceTypeModel> serviceType;
  const CustomHorizontalViewRoundedTabs({
    super.key,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: serviceType.length,
        itemBuilder: (_, index) {
          final serviceTypeItem = serviceType[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRoundedEdgedContainer(
                borderRadius: 200,
                child: Image.asset(
                  serviceTypeItem.iconImage,
                  height: 30,
                  width: 30,
                ),
              ),
              const CustomHeight(height: 10),
              Text(
                serviceTypeItem.name,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          );
        },
        separatorBuilder: (_, __) => const CustomWidth(width: 15),
      ),
    );
  }
}
