import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_tab.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../widgets/custom_car_rental_booking_status.dart';

class CarRentalBookingTabSectionView extends StatefulWidget {
  const CarRentalBookingTabSectionView({super.key});

  @override
  State<CarRentalBookingTabSectionView> createState() =>
      _CarRentalBookingTabSectionViewState();
}

class _CarRentalBookingTabSectionViewState
    extends State<CarRentalBookingTabSectionView> {
  //
  bool isCRBActiveSelected = false;
  bool isCRBCompletedSelected = false;
  bool isCRBCancelledSelected = false;

  Color activeTextColor = AppColors.appTextFadedColor;
  Color completedTextColor = AppColors.appTextFadedColor;
  Color cancelledTextColor = AppColors.appTextFadedColor;

  Color activeTabColor = AppColors.appWhiteColor;
  Color completedTabColor = AppColors.appWhiteColor;
  Color cancelledTabColor = AppColors.appWhiteColor;

  @override
  void initState() {
    super.initState();
    isCRBActiveSelected = true;
    activeTextColor = AppColors.appWhiteColor;
    activeTabColor = AppColors.appMainColor;
  }

  void _activeCRBSelected() {
    setState(() {
      isCRBActiveSelected = true;
      isCRBCancelledSelected = false;
      isCRBCompletedSelected = false;

      //
      activeTextColor = AppColors.appWhiteColor;
      completedTextColor = AppColors.appTextFadedColor;
      cancelledTextColor = AppColors.appTextFadedColor;
      activeTabColor = AppColors.appMainColor;
      completedTabColor = AppColors.appWhiteColor;
      cancelledTabColor = AppColors.appWhiteColor;
    });
  }

  void _completedCRBSelected() {
    setState(() {
      isCRBActiveSelected = false;
      isCRBCompletedSelected = true;
      isCRBCancelledSelected = false;

      //
      activeTextColor = AppColors.appTextFadedColor;
      completedTextColor = AppColors.appWhiteColor;
      cancelledTextColor = AppColors.appTextFadedColor;
      activeTabColor = AppColors.appWhiteColor;
      completedTabColor = AppColors.appMainColor;
      cancelledTabColor = AppColors.appWhiteColor;
    });
  }

  void _cancelledCRBSelected() {
    setState(() {
      isCRBActiveSelected = false;
      isCRBCompletedSelected = false;
      isCRBCancelledSelected = true;

      //
      activeTextColor = AppColors.appTextFadedColor;
      completedTextColor = AppColors.appTextFadedColor;
      cancelledTextColor = AppColors.appWhiteColor;
      activeTabColor = AppColors.appWhiteColor;
      completedTabColor = AppColors.appWhiteColor;
      cancelledTabColor = AppColors.appMainColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        isMainAxisSize: false,
        children: [
          //first section
          CustomColumn(
            children: [
              const CustomHeight(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My bookings",
                    style: customTextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () =>
                        AppNagivator.pushNamedRoute(bookingSearchRoute),
                    child: Image.asset(ImagesText.searchIcon),
                  ),
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
                    onTap: _activeCRBSelected,
                  ),
                  CustomBookingTab(
                    text: "Completed",
                    textColor: completedTextColor,
                    tabColor: completedTabColor,
                    onTap: _completedCRBSelected,
                    width: 120,
                  ),
                  CustomBookingTab(
                    text: "Cancelled",
                    textColor: cancelledTextColor,
                    tabColor: cancelledTabColor,
                    onTap: _cancelledCRBSelected,
                    width: 120,
                  ),
                ],
              ),
            ],
          ),

          const CustomHeight(height: 20),
          if (isCRBActiveSelected)
            //fetches all the user shorlet  bookings whose status is #active
            CustomListview(
              itemCount: LocalDatabase.carRentalPackages.length,
              itemBuilder: (_, index) {
                final activeItem = LocalDatabase.carRentalPackages[index];

                return CustomCarRentalBookingStatus(
                  carRental: activeItem,
                  statusText: "Paid",
                  statusColor: AppColors.appMainColor,
                  isActive: true,
                  isComplete: false,
                  isCancelled: false,
                );
              },
            ),

          if (isCRBCompletedSelected)
            //fetches all the user shorlet  bookings whose status is #completed
            CustomListview(
              itemCount: LocalDatabase.carRentalPackages.length,
              itemBuilder: (_, index) {
                final activeItem = LocalDatabase.carRentalPackages[index];

                return CustomCarRentalBookingStatus(
                  carRental: activeItem,
                  statusText: "Comp.",
                  statusColor: Colors.green,
                  isActive: false,
                  isComplete: true,
                  isCancelled: false,
                );
              },
            ),

          if (isCRBCancelledSelected)
            //fetches all the user shorlet  bookings whose status is #cancelled
            CustomListview(
              itemCount: LocalDatabase.carRentalPackages.length,
              itemBuilder: (_, index) {
                final activeItem = LocalDatabase.carRentalPackages[index];

                return CustomCarRentalBookingStatus(
                  carRental: activeItem,
                  statusText: "Cancel.",
                  statusColor: Colors.red,
                  isActive: false,
                  isComplete: false,
                  isCancelled: true,
                );
              },
            ),
        ],
      ),
    );
  }
}
