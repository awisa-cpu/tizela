import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomHostHomeConfirmationCard extends StatelessWidget {
  final VoidCallback onTapNoEditAvailability, onTapYesConfirmAvailability;
  const CustomHostHomeConfirmationCard({
    super.key,
    required this.onTapNoEditAvailability,
    required this.onTapYesConfirmAvailability,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomRoundedEdgedContainer(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 5.0,
              spreadRadius: 6.0,
              offset: const Offset(2, 2),
            )
          ],
          showBorder: false,
          paddingNumber: 30,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: CustomColumn(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesText.infoCircleIcon,
                    height: 20,
                  ),
                  const CustomWidth(width: 15),
                  CustomColumn(
                    children: [
                      Text(
                        "Kindly confirm your listings are",
                        textAlign: TextAlign.justify,
                        style: customTextStyle(),
                      ),
                      Text(
                        "available to guest today",
                        textAlign: TextAlign.justify,
                        style: customTextStyle(),
                      ),
                    ],
                  )
                ],
              ),
              const CustomHeight(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapNoEditAvailability,
                      child: Text(
                        "No, edit availability",
                        style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapYesConfirmAvailability,
                      child: Text(
                        "Yes, confirm",
                        style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(right: 0, top: 20, child: Image.asset(ImagesText.pattern1)),
        Positioned(
          bottom: 21,
          left: 0,
          child: Image.asset(
            ImagesText.pattern2,
          ),
        ),
        Positioned(right: 0, top: 20, child: Image.asset(ImagesText.pattern3)),
      ],
    );
  }
}
