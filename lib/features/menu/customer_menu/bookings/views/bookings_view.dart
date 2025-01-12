import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_sliver_and_tab_bar_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_booking_tab_section_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/car_rental_booking_tab_section_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/shortlet_bookings/shorlet_booking_tab_section_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tab.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return const CustomSliverAndTabBarView(
      shouldShowHeader: false,
      shouldCenterTitle: false,
      shouldImplyLeading: false,
      tabs: [
        CustomTab(
          text: "Shorlet",
          imageIcon: ImagesText.buildingIcon,
          iconColor: AppColors.appMainColor,
        ),
        CustomTab(
          text: "Car Rental",
          imageIcon: ImagesText.carIcon,
          iconColor: AppColors.appMainColor,
        ),
        CustomTab(
          text: "Boat cruise",
          imageIcon: ImagesText.shipIcon,
          iconColor: AppColors.appMainColor,
        ),
      ],
      tabBarView: TabBarView(
        children: [
          ShorletBookingTabSectionView(),
          CarRentalBookingTabSectionView(),
          BoatCruiseBookingTabSectionView()
        ],
      ),
    );
  }
}
