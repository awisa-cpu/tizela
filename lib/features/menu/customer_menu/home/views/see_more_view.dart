import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

import 'widgets/custom_see_more_header.dart';

class SeeMoreView extends StatelessWidget {
  final String headingText;
  final String subText;
  final ItemBuilder itemBuilder;
  final int itemCount;
  const SeeMoreView({
    super.key,
    required this.headingText,
    required this.subText,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.only(
            top: 25, left: 13.5, right: 13.5, bottom: 13.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSeeMoreHeader(
              headingText: headingText,
              subText: subText,
            ),
            const CustomHeight(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                // mainAxisExtent: 150,
              ),
              itemBuilder: itemBuilder,
            )
          ],
        ),
      ),
    );
  }
}
