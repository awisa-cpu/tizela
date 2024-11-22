import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomMapViewSection extends StatelessWidget {
  const CustomMapViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeight(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore area",
              style: customTextStyle(
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                //navigatie the user to a map interface
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View in a map",
                    style: customTextStyle(
                      fontSize: 12,
                      color: AppColors.appMainColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.appMainColor,
                  )
                ],
              ),
            )
          ],
        ),
        const CustomHeight(height: 12),
        SizedBox(
          width: context.screenWidth(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              ImagesText.mapFrame,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
