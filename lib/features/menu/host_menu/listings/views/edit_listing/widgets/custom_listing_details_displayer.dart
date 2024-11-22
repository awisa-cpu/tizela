import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomListingDetailsDisplayer extends StatelessWidget {
  ///create a custom listing displayer

  ///child and data must not be passed at the same time
  final String titleName;
  final VoidCallback onEditTap;
  final bool isJustText;
  final String? data;
  final Widget? child;
  final double? marginNumber;
  const CustomListingDetailsDisplayer({
    super.key,
    required this.titleName,
    required this.onEditTap,
    this.isJustText = true,
    this.data,
    this.child,
    this.marginNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      margin: EdgeInsets.only(top: marginNumber ?? 20),
      color: AppColors.appWhiteColor,
      borderColor: Colors.grey.withOpacity(0.15),
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleName,
                style: customTextStyle(fontSize: 16),
              ),
              GestureDetector(
                  onTap: onEditTap,
                  child: Image.asset(ImagesText.blackEditIcon)),
            ],
          ),
          const CustomHeight(),
          isJustText
              ? Text(
                  data ?? "",
                  style: customTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appTextFadedColor),
                )
              : child!
        ],
      ),
    );
  }
}
