import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../common/styles/custom_text_span.dart';

class CustomHomeHeaderSection extends StatelessWidget {
  final String userType;
  const CustomHomeHeaderSection({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello, ",
                            style: customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appTextFadedColor,
                            ),
                          ),
                          customTextSpan(
                            text: "$userType ",
                            fontsize: 16,
                          )
                        ],
                      ),
                    ),
                    Image.asset(ImagesText.handIcon)
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Image(
                      image: AssetImage(ImagesText.currentLocationIcon)),
                  Text(
                    "Lagos, Nigeria",
                    style: customTextStyle(
                      fontSize: 11,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ],
          )
        ]);
  }
}
