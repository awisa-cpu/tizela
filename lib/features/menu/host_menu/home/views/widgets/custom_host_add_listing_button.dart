import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomHostAddListingButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomHostAddListingButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedEdgedContainer(
        borderColor: AppColors.appTextFadedColor.withValues(alpha: 0.4),
        borderRadius: 10.0,
        child: Row(
          children: [
            Expanded(
              child: CustomColumn(
                children: [
                  Text(
                    "Add Listing",
                    style: customTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appTextFadedColor),
                  ),
                  const CustomHeight(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(ImagesText.addSqaureIcon),
                      const CustomWidth(width: 10),
                      Text(
                        "Create a new listing",
                        style: customTextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.chevron_right_outlined),
            )
          ],
        ),
      ),
    );
  }
}
