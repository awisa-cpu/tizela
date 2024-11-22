import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomHostBookingTypeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String mainText, subText;
  final String imageUrl;
  final Color? borderColor;
  final double borderWidth;
  final bool isTapped;
  const CustomHostBookingTypeButton({
    super.key,
    required this.onTap,
    required this.mainText,
    required this.subText,
    required this.imageUrl,
    this.borderColor,
    required this.borderWidth,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedEdgedContainer(
        borderColor: borderColor,
        borderWidth: borderWidth,
        child: Stack(
          children: [
            isTapped
                ? Positioned(
                    right: 1,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appMainColor,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                        weight: 10,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Row(
              children: [
                Image.asset(imageUrl),
                const CustomWidth(width: 10),
                Expanded(
                  child: CustomColumn(
                    children: [
                      Text(
                        mainText,
                        style: customTextStyle(fontSize: 17),
                      ),
                      // const CustomHeight(height: 10),
                      Text(
                        subText,
                        style: customTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.appTextFadedColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
