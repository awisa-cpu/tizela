import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class EmptyListingView extends StatelessWidget {
  final double screenHeight;
  final String mainText, subText;
  const EmptyListingView(
      {super.key,
      this.screenHeight = 0.5,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight() * screenHeight,
      //todo: review this design and it implications
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagesText.emptyListing),
            const CustomHeight(height: 13),
            Text(
              mainText,
              style: customTextStyle(
                fontSize: 18,
              ),
            ),
            const CustomHeight(height: 10),
            Text(
              subText,
              textAlign: TextAlign.center,
              style: customTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            const CustomHeight(height: 10),
            CustomEleButton(onPressed: () {}, text: "create listing")
          ],
        ),
      ),
    );
  }
}
