import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomOutlinedBookingStatusButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const CustomOutlinedBookingStatusButton({
    super.key,
    required this.onTap, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      onTap: onTap,
      actionText: buttonText,
      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
            foregroundColor: const WidgetStatePropertyAll(
              AppColors.appMainColor,
            ),
            side: const WidgetStatePropertyAll(
                BorderSide(color: AppColors.appMainColor)),
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.appWhiteColor),
          ),
    );
  }
}
