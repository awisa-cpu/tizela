import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomTabButtonWithIconAndText extends StatelessWidget {
  final String text, imageUrl;
  final Color textIconAndBorderColor, mainColor;
  final VoidCallback onTap;
  const CustomTabButtonWithIconAndText({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.textIconAndBorderColor,
    required this.mainColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedEdgedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        width: 150,
        borderRadius: 30,
        paddingNumber: 15.0,
        borderColor: textIconAndBorderColor,
        color: mainColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageUrl,
              color: textIconAndBorderColor,
            ),
            const CustomWidth(width: 10),
            Text(
              text,
              style: customTextStyle(
                fontSize: 14,
                color: textIconAndBorderColor,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
