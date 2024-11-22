import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_filter_sortby.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomNewListingShorletHouseRules extends StatelessWidget {
  final String headerText, firstText, secondText;
  final TextStyle? style;
  final bool isFirstValueChecked, isSecondValueChecked;
  final ValueChanged onFirstValueChanged, onSecondValueChanged;
  const CustomNewListingShorletHouseRules({
    super.key,
    required this.headerText,
    required this.firstText,
    required this.secondText,
    required this.isFirstValueChecked,
    required this.isSecondValueChecked,
    required this.onFirstValueChanged,
    required this.onSecondValueChanged,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: CustomColumn(
        children: [
          Text(
            headerText,
            style: style ?? customTextStyle(fontWeight: FontWeight.w600),
          ),
          const CustomHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomFilterSortBy(
                  color: isFirstValueChecked
                      ? AppColors.appMainColor
                      : AppColors.appIconColorBox,
                  textColor:
                      isFirstValueChecked ? AppColors.appWhiteColor : null,
                  text: firstText,
                  isChecked: isFirstValueChecked,
                  onValueChanged: onFirstValueChanged,
                  checkBoxActiveColor:
                      isFirstValueChecked ? AppColors.appWhiteColor : null,
                  checkBoxCheckColor:
                      isFirstValueChecked ? AppColors.appMainColor : null,
                ),
              ),
              const CustomWidth(width: 13.5),
              Expanded(
                child: CustomFilterSortBy(
                  color: !isSecondValueChecked
                      ? AppColors.appIconColorBox
                      : AppColors.appMainColor,
                  textColor:
                      !isSecondValueChecked ? null : AppColors.appWhiteColor,
                  text: secondText,
                  isChecked: isSecondValueChecked,
                  onValueChanged: onSecondValueChanged,
                  checkBoxActiveColor:
                      isSecondValueChecked ? AppColors.appWhiteColor : null,
                  checkBoxCheckColor:
                      isSecondValueChecked ? AppColors.appMainColor : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
