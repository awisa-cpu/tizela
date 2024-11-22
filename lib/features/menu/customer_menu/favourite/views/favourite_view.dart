import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_sliver_and_tab_bar_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tab.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight - 30),
        child: CustomSliverAndTabBarView(
          shouldImplyLeading: false,
          title: "Favourites",
          tabs: const [
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
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
