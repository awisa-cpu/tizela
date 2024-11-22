import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomCheckboxWithText extends StatelessWidget {
  final String text;
  bool isSpaceBetween, isCheckBoxFirst, isChecked;
  final bool isShapeDifferent;
  final Color? activeColor;
  final ValueChanged<bool?>? onValueChanged;

  CustomCheckboxWithText({
    super.key,
    required this.text,
    required this.isChecked,
    this.isSpaceBetween = true,
    this.isShapeDifferent = false,
    this.isCheckBoxFirst = false,
    this.activeColor = AppColors.appMainColor,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: isSpaceBetween
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          isCheckBoxFirst
              ? SizedBox(
                  width: 30,
                  child: Checkbox(
                      activeColor: activeColor,
                      value: isChecked,
                      shape: isShapeDifferent ? const CircleBorder() : null,
                      onChanged: onValueChanged),
                )
              : Text(
                  text,
                  style: customTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: isSpaceBetween
                        ? AppColors.appTextFadedColor
                        : AppColors.appBlackColor,
                  ),
                ),
          isCheckBoxFirst
              ? Text(
                  text,
                  style: customTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: isSpaceBetween
                        ? AppColors.appTextFadedColor
                        : AppColors.appBlackColor,
                  ),
                )
              : Checkbox(
                  activeColor: AppColors.appMainColor,
                  value: isChecked,
                  shape: isShapeDifferent ? const CircleBorder() : null,
                  onChanged: onValueChanged)
        ],
      ),
    );
  }
}
