import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomEditIdNameAndCardDisplayer extends StatelessWidget {
  const CustomEditIdNameAndCardDisplayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Text(
          "International Passport",
          style: customTextStyle(
              fontSize: 14,
              color: AppColors.appTextFadedColor,
              fontWeight: FontWeight.w500),
        ),
        const CustomHeight(),
        CustomRoundedEdgedContainer(
          paddingNumber: 14,
          borderRadius: 10,
          borderColor: Colors.grey.withValues(alpha: 0.5),
          child: Stack(
            children: [
              Positioned(
                right: 1,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.appMainColor,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                    weight: 10,
                  ),
                ),
              ),
              Row(
                children: [
                  Image.asset(ImagesText.fileUploadIcon),
                  const CustomWidth(width: 10),

                  //disply card details
                  Expanded(
                    child: CustomColumn(
                      children: [
                        //name of card.ext
                        Text(
                          "ID.png",
                          style: customTextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),

                        //size and upload status
                        Text(
                          "200 KB -100% uploaded",
                          style: customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF667085)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
