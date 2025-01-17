import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomBookingStatus extends StatelessWidget {
  final String statusText;
  final Color textAndBorderColor;
  const CustomBookingStatus({
    super.key,
    required this.statusText,
    required this.textAndBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.appWhiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: textAndBorderColor)),
      child: Text(
        statusText,
        style: customTextStyle(
            color: textAndBorderColor,
            fontWeight: FontWeight.normal,
            fontSize: 10,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
