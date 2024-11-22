import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/home/model/more_service_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class MoreSectionTab extends StatelessWidget {
  final MoreServiceModel serviceModel;

  final VoidCallback onTap;
  const MoreSectionTab({
    super.key,
    required this.onTap,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.appMainColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Text(
          "${serviceModel.name} (${serviceModel.count})",
          style: customTextStyle(
            color: AppColors.appWhiteColor,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
