import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomAddOrRemoveButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData actionIndicator;
  const CustomAddOrRemoveButton({
    super.key,
    required this.actionIndicator,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedEdgedContainer(
        paddingNumber: 5,
        borderColor: AppColors.appTextFadedColor.withValues(alpha: 0.3),
        borderWidth: 1.5,
        boxShape: BoxShape.circle,
        child: Icon(
          actionIndicator,
          color: Colors.grey.withValues(alpha: 0.85),
        ),
      ),
    );
  }
}
