import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_with_size.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomHostCarRentalOrBoatCruiseBookingsTab extends StatelessWidget {
  final bool isOngoing;
  final Color stateColor;
  final String imageUrl;
  const CustomHostCarRentalOrBoatCruiseBookingsTab({
    super.key,
    required this.isOngoing,
    required this.stateColor,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      child: CustomRoundedEdgedContainer(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5.0,
              spreadRadius: 6.0,
              offset: const Offset(2, 2))
        ],
        paddingNumber: 0.0,
        color: AppColors.appWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(13.5),
          child: CustomColumn(
            children: [
              //first section: state and date
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: stateColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const CustomWidth(width: 3),
                  Text(AppDateFormater.formatDate(date:DateTime.now()))
                ],
              ),
              const CustomHeight(height: 15),

              //shorlet details
              Row(
                children: [
                  CustomDisplayClipImageWithSize(
                    imageUrl: imageUrl,
                  ),
                  const CustomWidth(width: 10),
                  CustomColumn(
                    children: [
                      //name
                      Text(
                        "Sunderam Boys  PG",
                        style: customTextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const CustomHeight(height: 5),
                      Text(
                        "Booked by Asuquo Godwin",
                        style: customTextStyle(
                          fontSize: 12,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),

                      const CustomHeight(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImagesText.timeCircleIcon),
                          const CustomWidth(width: 5),
                          Text(
                            "3 night",
                            style: customTextStyle(
                                fontSize: 12,
                                color: AppColors.appTextFadedColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      //cost
                    ],
                  )
                ],
              ),
              const CustomHeight(height: 15),

              //shorlet attributes
              CustomRoundedEdgedContainer(
                borderColor: isOngoing ? AppColors.appIconColor : null,
                color: isOngoing
                    ? AppColors.appIconColorBox
                    : AppColors.appWhiteColor,
                showBorder: isOngoing,
                child: Row(
                  children: [
                    Image.asset(ImagesText.guestIcon),
                    const CustomWidth(width: 4),
                    Text(
                      "4 passengers",
                      style: customTextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                    const CustomWidth(width: 5),
                    const SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        thickness: 0.0,
                        width: 20,
                        color: Colors.black,
                      ),
                    ),
                    const CustomWidth(width: 5),
                    Image.asset(ImagesText.calendarIcon),
                    const CustomWidth(width: 4),
                    Text(
                      "19th May, 2024",
                      style: customTextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
