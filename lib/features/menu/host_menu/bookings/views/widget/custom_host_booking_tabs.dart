import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomHostBookingTabs extends StatelessWidget {
  final VoidCallback onGoingChange;
  final VoidCallback onCompletedChange;
  final VoidCallback onCancelledChange;

  final Color onGoingBorderColor;
  final Color completedBorderColor;
  final Color cancelledBorderColor;

  final double onGoingWidth, onGoingTextSize;
  final double completedWidth, completedTextSize;
  final double cancelledWidth, cancelledTextSize;

  final int onGoingCount, cancelledCount, completedCount;

  const CustomHostBookingTabs({
    super.key,
    required this.onGoingChange,
    required this.onCompletedChange,
    required this.onCancelledChange,
    required this.onGoingBorderColor,
    required this.completedBorderColor,
    required this.cancelledBorderColor,
    required this.onGoingWidth,
    required this.onGoingTextSize,
    required this.completedWidth,
    required this.completedTextSize,
    required this.cancelledWidth,
    required this.cancelledTextSize,
    required this.onGoingCount,
    required this.cancelledCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 13.5,
      ),
      child: CustomColumn(
        children: [
          const CustomHeight(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My bookings",
                style: customTextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  AppNagivator.pushNamedRoute(
                    bookingSearchRoute,
                  );
                },
                child: Image.asset(ImagesText.searchIcon),
              ),
            ],
          ),
          const CustomHeight(height: 25),

          //tabs
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onGoingChange,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      border: Border(
                        bottom: BorderSide(
                          color: onGoingBorderColor,
                          width: onGoingWidth,
                        ),
                      ),
                    ),
                    child: Text(
                      "Ongoing ($onGoingCount)",
                      style: customTextStyle(
                        color: onGoingBorderColor,
                        fontSize: onGoingTextSize,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onCompletedChange,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      border: Border(
                        bottom: BorderSide(
                          color: completedBorderColor,
                          width: completedWidth,
                        ),
                      ),
                    ),
                    child: Text(
                      "Completed ($completedCount)",
                      style: customTextStyle(
                        color: completedBorderColor,
                        fontSize: completedTextSize,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onCancelledChange,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      border: Border(
                        bottom: BorderSide(
                          color: cancelledBorderColor,
                          width: cancelledWidth,
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancelled ($cancelledCount)",
                      style: customTextStyle(
                        color: cancelledBorderColor,
                        fontSize: cancelledTextSize,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
