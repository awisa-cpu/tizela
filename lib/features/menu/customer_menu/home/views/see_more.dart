import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';

import 'widgets/custom_see_more_header.dart';
import 'widgets/custom_see_more_items_grid.dart';

class SeeMoreView extends StatelessWidget {
  final String headingText;
  final String subText;
  final List serviceType;
  const SeeMoreView({
    super.key,
    required this.headingText,
    required this.subText,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
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
            CustomSeeMoreItemsGrid(
              serviceType: serviceType,
            )
          ],
        ),
      ),
    );
  }
}
