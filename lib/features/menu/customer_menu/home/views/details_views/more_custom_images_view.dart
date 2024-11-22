import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class MoreCustomImagesView extends StatelessWidget {
  final String headerText;
  final int listItemCount, gridItemCount;
  final ItemBuilder itemBuilder, gridBuilder;
  const MoreCustomImagesView({
    super.key,
    required this.headerText,
    required this.listItemCount,
    required this.gridItemCount,
    required this.itemBuilder,
    required this.gridBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: const EdgeInsets.symmetric(
          horizontal: 13.5,
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => AppNagivator.goBack(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const CustomWidth(width: 5),
                Text(
                  headerText,
                  style: customTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
              child: ListView.separated(
                itemCount: listItemCount,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: itemBuilder,
                separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
            const CustomHeight(height: 15),
            GridView.builder(
              shrinkWrap: true,
              itemCount: gridItemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: gridBuilder,
            ),
          ],
        ),
      ),
    );
  }
}
