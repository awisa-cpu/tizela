import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomGuestOptions extends StatelessWidget {
  final String mainText;
  final String? subText;
  final VoidCallback onAdd, onRemove;
  const CustomGuestOptions({
    super.key,
    required this.mainText,
    this.subText,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mainText,
              style: customTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (subText != null)
              Text(
                subText!,
                style: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor),
              )
          ],
        ),

        //buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200)),
              child: const Icon(Icons.remove),
            ),
            const CustomWidth(
              width: 4,
            ),
            Text(
              "2",
              style: customTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const CustomWidth(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200)),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
