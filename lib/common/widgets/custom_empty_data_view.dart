import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomEmptyDataView extends StatelessWidget {
  final String mainText, subText;
  final double screenHeight;
  final String? imageUrl;
  const CustomEmptyDataView({
    super.key,
    required this.mainText,
    required this.subText,
    this.screenHeight = 0.60,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight() * screenHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl ?? ImagesText.bookingsImage,
              width: 150,
              height: 140,
            ),
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
          ],
        ),
      ),
    );
  }
}
