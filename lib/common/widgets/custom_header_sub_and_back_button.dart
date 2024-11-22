import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomHeaderSubAndBackButton extends StatelessWidget {
  final String headerText;
  final String? subText;
  final bool isthereSubText;
  final VoidCallback? onTap;
  const CustomHeaderSubAndBackButton({
    super.key,
    required this.headerText,
    this.subText,
    this.isthereSubText = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTap ?? () => AppNagivator.goBack(context),
              child: const Icon(Icons.arrow_back_rounded),
            ),
            const CustomWidth(width: 15),
            Text(
              headerText,
              style: customTextStyle(fontSize: 20),
            )
          ],
        ),
        const CustomHeight(height: 10),
        isthereSubText
            ? Text(
                subText ?? "",
                textAlign: TextAlign.start,
                style: customTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appTextFadedColor,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
