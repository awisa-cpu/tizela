import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/host_bookings_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/host_home_view.dart';
import 'package:tizela/features/menu/host_menu/inbox/views/host_inbox_view.dart';
import 'package:tizela/features/menu/host_menu/listings/views/listings_home/host_listings_view.dart';
import 'package:tizela/features/personalization/host_personalization/profile/controller/host_profile_controller.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../features/personalization/host_personalization/profile/controller/payment_details_controller.dart';
import '../features/personalization/host_personalization/profile/views/host_profile_view.dart';

class AppHostMenu extends StatefulWidget {
  const AppHostMenu({super.key});

  @override
  State<AppHostMenu> createState() => _AppMenuHostNavigator();
}

class _AppMenuHostNavigator extends State<AppHostMenu> {
  int _currentIndex = 0;

 

  @override
  Widget build(BuildContext context) {

     Get.put(HostProfileController());
      Get.put(PaymentDetailsController());

    //
    return Scaffold(
      body: _menuBodyBuilder(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        onTap: _onMenuChanged,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: customTextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.appMainColor),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.homeIcon,
              color: _currentIndex == 0 ? AppColors.appMainColor : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.hostListingsIcon,
              color: _currentIndex == 1 ? AppColors.appMainColor : null,
            ),
            label: "Listings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.hostBookingsIcon,
              color: _currentIndex == 2 ? AppColors.appMainColor : null,
            ),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.inboxIcon,
              color: _currentIndex == 3 ? AppColors.appMainColor : null,
            ),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.profileIcon,
              color: _currentIndex == 4 ? AppColors.appMainColor : null,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
   void _onMenuChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _menuBodyBuilder(int index) {
    switch (index) {
      case 0:
        return const HostHomeView();

      case 1:
        return const HostListingsView();

      case 2:
        return const HostBookingsView();
      case 3:
        return const HostInboxView();

      case 4:
        return const HostProfileView();

      default:
        return Container();
    }
  }
}
