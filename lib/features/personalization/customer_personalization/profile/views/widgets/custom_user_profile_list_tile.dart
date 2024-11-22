import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomUserProfileListTile extends StatelessWidget {
  final String titleText;
  final String? subText;
  final Widget? trailing;
  final VoidCallback onTap;
  const CustomUserProfileListTile(
      {super.key,
      required this.titleText,
      this.subText,
      this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      enableFeedback: false,
      title: Text(
        titleText,
        style: customTextStyle(fontSize: 16),
      ),
      subtitle: subText != null
          ? Text(
              subText!,
              style: customTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appTextFadedColor),
            )
          : null,
      trailing: trailing,
    );
  }
}
