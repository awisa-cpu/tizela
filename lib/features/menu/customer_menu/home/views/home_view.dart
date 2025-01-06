import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/see_more_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_see_more_item.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../../../common/styles/custom_text_style.dart';
import '../../../../../common/widgets/custom_section_header.dart';
import '../../../../../utils/shimmers/app_custom_shimmer.dart';
import '../../../../personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import '../../favourite/controller/custom_boat_cruise_favourite_controller.dart';
import '../../favourite/controller/custom_car_rental_favourite_controller.dart';
import '../../favourite/controller/customer_shortlet_favourite_controller.dart';
import '../controller/customer_home_controller.dart';
import 'search_and_filter_views/custom_search_boat_cruise_view.dart';
import 'search_and_filter_views/custom_search_car_rental_view.dart';
import 'search_and_filter_views/custom_shorlet_search_view.dart';
import 'widgets/custom_home_header_section.dart';
import 'widgets/custom_home_service_type_views.dart';
import 'widgets/custom_home_view_service_displayer.dart';
import 'widgets/custom_horizontal_view_vertical_tabs.dart';
import 'widgets/custom_package_service.dart';
import 'widgets/custom_home_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfileController = CustomerProfileController.instance;
    Get.put(CustomerHomeController());
    final controller = CustomerHomeController.instance;
    Get.put(CustomCarRentalFavouriteController());
    Get.put(CustomBoatCruiseFavouriteController());
        Get.put(CustomShortletFavouriteController());
    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          children: [
            const CustomHeight(height: 50),

            ///section 1: header and tabs
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //header section
                Obx(
                  () {
                    if (userProfileController.isUserStillLoading.value) {
                      return Row(
                        children: [
                          Text(
                            "Hello, ",
                            style: customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appTextFadedColor,
                            ),
                          ),
                          const AppCustomShimmerEffect(
                            height: 25,
                            width: 45,
                            radius: 4,
                          ),
                          Image.asset(ImagesText.handIcon)
                        ],
                      );
                    }
                    return CustomHomeHeaderSection(
                      userType:
                          userProfileController.currentAppUser.value.firstName,
                    );
                  },
                ),
                const CustomHeight(height: 30),

                //selectable tabs
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomPackageService(
                        icon: ImagesText.buildingIcon,
                        title: 'Stay',
                        borderColor: controller.stayBorderColor.value,
                        textAndIconColor: controller.stayTextAndIconColor.value,
                        fontWeight: controller.stayFontWeight.value,
                        onTap: controller.updateBasedOnStay,
                      ),
                      CustomPackageService(
                        icon: ImagesText.carIcon,
                        title: 'Car rental',
                        borderColor: controller.carRentalBorderColor.value,
                        textAndIconColor:
                            controller.carRentalTextAndIconColor.value,
                        fontWeight: controller.carRentalFontWeight.value,
                        onTap: controller.updateBasedOnRentCars,
                      ),
                      CustomPackageService(
                        icon: ImagesText.shipIcon,
                        title: 'Boat cruise',
                        borderColor: controller.boatCruiseBorderColor.value,
                        textAndIconColor:
                            controller.boatCruiseTextAndIconColor.value,
                        fontWeight: controller.boatCruiseFontWeight.value,
                        onTap: controller.updateBasedOnRentBoats,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const CustomHeight(
              height: 30,
            ),

            ///section 2:search bar
            Obx(
              () => CustomHomeSearchBar(
                mainText: controller.isStaySelected.value
                    ? "Find stay"
                    : controller.isCarRentalSelected.value
                        ? "Rent Car"
                        : controller.isBoatCruiseSelected.value
                            ? "Boat cruise"
                            : "Search",
                hintText: controller.isStaySelected.value
                    ? "Location. Dates, Guest"
                    : controller.isCarRentalSelected.value
                        ? "Pick-up.Drop-off.Dates"
                        : controller.isBoatCruiseSelected.value
                            ? "Location or boat types"
                            : "",
                onTap: () {
                  if (controller.isStaySelected.value) {
                    AppNagivator.pushRoute(const CustomSearchStayView());
                  }

                  if (controller.isCarRentalSelected.value) {
                    AppNagivator.pushRoute(const CustomSearchCarRentalView());
                  }

                  if (controller.isBoatCruiseSelected.value) {
                    AppNagivator.pushRoute(const CustomSearchBoatCruiseView());
                  }
                },
              ),
            ),

            const CustomHeight(
              height: 30,
            ),

            ///section 3:
            Obx(
              () => CustomHomeServiceTypeViews(
                isStaySelected: controller.isStaySelected.value,
                isCarRentalSelected: controller.isCarRentalSelected.value,
                isBoatCruiseSelected: controller.isBoatCruiseSelected.value,
              ),
            ),

            ///section 4: only for shortlet
            Obx(
              () {
                return controller.isStaySelected.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomHeight(height: 30),
                          CustomSectionHeader(
                            mainText: "Popular destinations",
                            onTapSeeAll: () {
                              if (controller.isStaySelected.value) {
                                AppNagivator.pushRoute(
                                  SeeMoreView(
                                    headingText: "Popular Destinations",
                                    subText:
                                        "Here is the comprehensive list of all popular destinations \ncurated just for you",
                                    itemCount:
                                        LocalDatabase.destinationService.length,
                                    itemBuilder: (context, index) {
                                      final destinationItem = LocalDatabase
                                          .destinationService[index];
                                      return CustomSeeMoreItem(
                                        imageUrl: destinationItem.imageUrl,
                                        name: destinationItem.destinationName,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        imageHeight: 110,
                                        imageWidth: 110,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          const CustomHeight(height: 10),
                          CustomHorizontalViewVerticalTabs(
                            destinationData: LocalDatabase.destinationService,
                          ),
                        ],
                      )
                    : const CustomHeight(height: 30);
              },
            ),

            ///section 5:
            Obx(
              () => CustomHomeViewServiceDisplayer(
                isStaySelected: controller.isStaySelected.value,
                isCarRentalSelected: controller.isCarRentalSelected.value,
                isBoatCruiseSelected: controller.isBoatCruiseSelected.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
