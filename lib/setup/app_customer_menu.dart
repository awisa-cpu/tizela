import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/bookings_view.dart';
import 'package:tizela/features/menu/customer_menu/favourite/views/favourite_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/home_view.dart';
import 'package:tizela/features/menu/customer_menu/inbox/views/inbox_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/customer_profile_view.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../features/personalization/customer_personalization/profile/controller/customer_profile_controller.dart';

class AppCustomerMenu extends StatefulWidget {
  const AppCustomerMenu({super.key});

  @override
  State<AppCustomerMenu> createState() => _AppCustomerMenuState();
}

class _AppCustomerMenuState extends State<AppCustomerMenu> {
  int _currentIndex = 0;

  void _onMenuChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.put(CustomerProfileController());

    bool isUser =
        userProfileController.currentAppUser.value.emailAddress.isEmpty;

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
              ImagesText.swapIcon,
              color: _currentIndex == 1 ? AppColors.appMainColor : null,
            ),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesText.heartIcon,
              color: _currentIndex == 2 ? AppColors.appMainColor : null,
            ),
            label: "Favourite",
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
            label: isUser ? "Sign in" : "Profile",
          ),
        ],
      ),
    );
  }

  Widget _menuBodyBuilder(int index) {
    switch (index) {
      case 0:
        return const HomeView();

      case 1:
        return const BookingsView();

      case 2:
        return const FavouriteView();

      case 3:
        return const InboxView();

      case 4:
        return const CustomerProfileView();

      default:
        return Container();
    }
  }
}
