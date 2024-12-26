import 'package:flutter/material.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged onValueChanged;
  const CustomSwitchButton({super.key, required this.value, required this.onValueChanged});





  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveTrackColor: Colors.grey.withValues(alpha:0.32),
      inactiveThumbColor: AppColors.appWhiteColor,
      trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
      value: value,
      onChanged: onValueChanged,
    );
  }
}
