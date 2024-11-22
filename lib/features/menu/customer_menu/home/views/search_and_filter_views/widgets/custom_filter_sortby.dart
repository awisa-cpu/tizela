import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomFilterSortBy extends StatelessWidget {
  final String text;
  final bool isChecked;
  final double? width;
  final Color? color, textColor, checkBoxCheckColor, checkBoxActiveColor;
  final ValueChanged onValueChanged;
  const CustomFilterSortBy({
    super.key,
    required this.text,
    required this.isChecked,
    this.width,
    this.color,
    this.textColor,
    required this.onValueChanged,
    this.checkBoxCheckColor,
    this.checkBoxActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      width: width,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 5),
      paddingNumber: 4.5,
      borderRadius: 2.0,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onValueChanged,
            activeColor: checkBoxActiveColor,
            checkColor: checkBoxCheckColor,
            shape: const CircleBorder(),
          ),
          Text(
            text,
            style: customTextStyle(
              fontSize: 14,
              color: textColor ?? AppColors.appTextFadedColor,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
