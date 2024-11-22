import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../common/widgets/custom_rounded_container.dart';

class CustomTabs extends StatelessWidget {
  final List<String> locations;
  final double? height, width;
  final Alignment? alignment;
  final TextOverflow? overflow;
  const CustomTabs({
    super.key,
    required this.locations,
    this.height = 40,
    this.width = 85,
    this.alignment = Alignment.center,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: locations.length,
          itemBuilder: (_, index) {
            final location = locations[index];

            return CustomRoundedEdgedContainer(
              alignment: alignment,
              height: height,
              width: width,
              borderRadius: 25,
              paddingNumber: 10,
              child: Text(
                location,
                style: customTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appTextFadedColor,
                  overflow: overflow,
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const CustomWidth(width: 10)),
    );
  }
}
