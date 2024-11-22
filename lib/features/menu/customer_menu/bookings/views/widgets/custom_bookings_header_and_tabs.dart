import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_tab.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomBookingsHeaderAndTabs extends StatefulWidget {
  const CustomBookingsHeaderAndTabs({
    super.key,
  });

  @override
  State<CustomBookingsHeaderAndTabs> createState() =>
      _CustomBookingsHeaderAndTabsState();
}

class _CustomBookingsHeaderAndTabsState
    extends State<CustomBookingsHeaderAndTabs> {
  bool isActiveSelected = false;
  bool isCompletedSelected = false;
  bool isCancelledSelected = false;

  Color activeTextColor = AppColors.appTextFadedColor;
  Color completedTextColor = AppColors.appTextFadedColor;
  Color cancelledTextColor = AppColors.appTextFadedColor;

  Color activeTabColor = AppColors.appWhiteColor;
  Color completedTabColor = AppColors.appWhiteColor;
  Color cancelledTabColor = AppColors.appWhiteColor;

  @override
  void initState() {
    super.initState();
    isActiveSelected = true;
    activeTextColor = AppColors.appWhiteColor;
    activeTabColor = AppColors.appMainColor;
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomHeight(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My bookings",
              style: customTextStyle(fontSize: 16),
            ),
            Image.asset(ImagesText.searchIcon),
          ],
        ),
        const CustomHeight(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBookingTab(
              text: "Active",
              textColor: activeTextColor,
              tabColor: activeTabColor,
              onTap: _activeSelected,
            ),
            CustomBookingTab(
              text: "Completed",
              textColor: completedTextColor,
              tabColor: completedTabColor,
              onTap: _completedSelected,
              width: 120,
            ),
            CustomBookingTab(
              text: "Cancelled",
              textColor: cancelledTextColor,
              tabColor: cancelledTabColor,
              onTap: _cancelledSelected,
              width: 120,
            ),
          ],
        ),
      ],
    );
  }

  void _activeSelected() {
    setState(() {
      isActiveSelected = true;
      isCancelledSelected = false;
      isCompletedSelected = false;

      //
      activeTextColor = AppColors.appWhiteColor;
      completedTextColor = AppColors.appTextFadedColor;
      cancelledTextColor = AppColors.appTextFadedColor;
      activeTabColor = AppColors.appMainColor;
      completedTabColor = AppColors.appWhiteColor;
      cancelledTabColor = AppColors.appWhiteColor;
    });
  }

  void _completedSelected() {
    setState(() {
      isActiveSelected = false;
      isCompletedSelected = true;
      isCancelledSelected = false;

      //
      activeTextColor = AppColors.appTextFadedColor;
      completedTextColor = AppColors.appWhiteColor;
      cancelledTextColor = AppColors.appTextFadedColor;
      activeTabColor = AppColors.appWhiteColor;
      completedTabColor = AppColors.appMainColor;
      cancelledTabColor = AppColors.appWhiteColor;
    });
  }

  void _cancelledSelected() {
    setState(() {
      isActiveSelected = false;
      isCompletedSelected = false;
      isCancelledSelected = true;

      //
      activeTextColor = AppColors.appTextFadedColor;
      completedTextColor = AppColors.appTextFadedColor;
      cancelledTextColor = AppColors.appWhiteColor;
      activeTabColor = AppColors.appWhiteColor;
      completedTabColor = AppColors.appWhiteColor;
      cancelledTabColor = AppColors.appMainColor;
    });
  }
}
