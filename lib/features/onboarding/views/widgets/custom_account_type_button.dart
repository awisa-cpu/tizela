import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomAccountTypeButton extends StatelessWidget {
  final String mainText;
  final String subText;
  final String icon;
  final Color? borderColor;
  final double borderWidth;
  final bool isTapped;
  final VoidCallback onTap;
  const CustomAccountTypeButton({
    super.key,
    required this.mainText,
    required this.subText,
    required this.icon,
    required this.onTap,
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
                CustomRoundedEdgedContainer(
                  color: AppColors.appIconColorBox,
                  showBorder: false,
                  alignment: Alignment.center,
                  child: Image.asset(icon),
                ),
                const CustomWidth(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainText, style: customTextStyle(fontSize: 18)),
                      const CustomHeight(height: 5),
                      Text(
                        subText,
                        style: customTextStyle(
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w400,
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
