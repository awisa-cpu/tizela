import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSectionHeader extends StatelessWidget {
  final String mainText;
  final VoidCallback? onTapSeeAll;
  final bool showViewAll;
  const CustomSectionHeader({
    super.key,
    required this.mainText,
    this.onTapSeeAll,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: customTextStyle(fontSize: 14),
        ),
        showViewAll
            ? GestureDetector(
                onTap: onTapSeeAll,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "See all",
                      style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.appMainColor,
                    )
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
