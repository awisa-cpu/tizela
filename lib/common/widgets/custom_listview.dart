import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomListview extends StatelessWidget {
  final int itemCount;
  final ItemBuilder itemBuilder;
  final bool isDefaultSeperator;
  final bool isPaddingNeeded;
  final bool isScrollable;
  final double? seperatedBuilderHeight, seperatedBuilderWidth;
  final Axis? scrollDirection;

  const CustomListview({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.isDefaultSeperator = true,
    this.isPaddingNeeded = true,
    this.isScrollable = false,
    this.seperatedBuilderHeight,
    this.scrollDirection,
    this.seperatedBuilderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: isPaddingNeeded ? null : EdgeInsets.zero,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: scrollDirection ?? Axis.vertical,
      itemBuilder: itemBuilder,
      separatorBuilder: (_, __) => isDefaultSeperator
          ? (Axis.vertical == scrollDirection
              ? CustomHeight(height: seperatedBuilderHeight ?? 10)
              : CustomWidth(
                  width: seperatedBuilderWidth ?? 10,
                ))
          : const CustomDivider(
              opacityLevel: 0.17,
            ),
    );
  }
}
