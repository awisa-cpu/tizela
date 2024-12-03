import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomGridSelectableServiceTypes extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final bool isThereSpaceAfterTitle, isThereSpaceAfterItems;
  final ItemBuilder itemBuilder;
  final int itemCount;
  final double? mainAxisExtent, crossAxisSpacing;
  final double? titleSpacing;

  const CustomGridSelectableServiceTypes(
      {super.key,
      required this.title,
      this.style,
      this.isThereSpaceAfterTitle = true,
      this.isThereSpaceAfterItems = true,
      required this.itemBuilder,
      required this.itemCount,
      this.mainAxisExtent = 60,
      this.crossAxisSpacing,
      this.titleSpacing});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomHeight(height: 15),
        Text(
          title,
          style: style ??
              customTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.appTextFadedColor,
              ),
        ),
        isThereSpaceAfterTitle
            ? CustomHeight(height: titleSpacing ?? 30)
            : const SizedBox.shrink(),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              mainAxisExtent: mainAxisExtent,
              crossAxisSpacing: crossAxisSpacing ?? 0.0),
          itemBuilder: itemBuilder,
        ),
        isThereSpaceAfterItems
            ? const CustomHeight(height: 40)
            : const SizedBox.shrink(),
      ],
    );
  }
}
