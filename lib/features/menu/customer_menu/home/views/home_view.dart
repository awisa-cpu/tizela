import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/see_more.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../../../common/styles/custom_text_style.dart';
import '../../../../../common/widgets/custom_section_header.dart';
import '../../../../../utils/shimmers & loaders/app_custom_shimmer.dart';
import '../../../../personalization/customer_personalization/profile/controller/customer_profile_controller.dart';
import 'widgets/custom_home_header_section.dart';
import 'widgets/custom_home_view_section2.dart';
import 'widgets/custom_home_view_section4.dart';
import 'widgets/custom_horizontal_view_vertical_tabs.dart';
import 'widgets/custom_package_service.dart';
import 'widgets/custom_search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isStaySelected = false;
  bool isCarRentalSelected = false;
  bool isBoatCruiseSelected = false;

  Color stayBorderColor = Colors.grey.shade200;
  Color stayTextAndIconColor = AppColors.appTextFadedColor;
  FontWeight stayFontWeight = FontWeight.normal;

  Color carRentalBorderColor = Colors.grey.shade200;
  Color carRentalTextAndIconColor = AppColors.appTextFadedColor;
  FontWeight carRentalFontWeight = FontWeight.normal;

  Color boatCruiseBorderColor = Colors.grey.shade200;
  Color boatCruiseTextAndIconColor = AppColors.appTextFadedColor;
  FontWeight boatCruiseFontWeight = FontWeight.normal;

  @override
  void initState() {
    super.initState();
    isStaySelected = true;
    stayBorderColor = AppColors.appMainColor;
    stayTextAndIconColor = AppColors.appMainColor;
    stayFontWeight = FontWeight.bold;
  }

  @override
  Widget build(BuildContext context) {
    final userProfileController = CustomerProfileController.instance;
    //
    return Scaffold(
      body: CustomScrollLayoutWidget(
        child: Column(
          children: [
            const CustomHeight(height: 50),

            ///section 1:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
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
                }),
                const CustomHeight(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomPackageService(
                      icon: ImagesText.buildingIcon,
                      title: 'Stay',
                      borderColor: stayBorderColor,
                      textAndIconColor: stayTextAndIconColor,
                      fontWeight: stayFontWeight,
                      onTap: _updateBasedOnStay,
                    ),
                    CustomPackageService(
                      icon: ImagesText.carIcon,
                      title: 'Car rental',
                      borderColor: carRentalBorderColor,
                      textAndIconColor: carRentalTextAndIconColor,
                      fontWeight: carRentalFontWeight,
                      onTap: _updateBasedOnRentCars,
                    ),
                    CustomPackageService(
                      icon: ImagesText.shipIcon,
                      title: 'Boat cruise',
                      borderColor: boatCruiseBorderColor,
                      textAndIconColor: boatCruiseTextAndIconColor,
                      fontWeight: boatCruiseFontWeight,
                      onTap: _updateBasedOnRentBoats,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            CustomSearchBar(
              mainText: isStaySelected
                  ? "Find stay"
                  : isCarRentalSelected
                      ? "Rent Car"
                      : isBoatCruiseSelected
                          ? "Boat cruise"
                          : "Search",
              hintText: isStaySelected
                  ? "Location. Dates, Guest"
                  : isCarRentalSelected
                      ? "Pick-up.Drop-off.Dates"
                      : isBoatCruiseSelected
                          ? "Location or boat types"
                          : "Search",
              onTap: () {
                if (isStaySelected) {
                  AppNagivator.pushNamedRoute(context, searchStayRoute);
                }

                if (isCarRentalSelected) {
                  AppNagivator.pushNamedRoute(context, searchCarRentalRoute);
                }

                if (isBoatCruiseSelected) {
                  AppNagivator.pushNamedRoute(context, searchBoatCruiseRoute);
                }
              },
            ),

            ///section 2:
            const SizedBox(
              height: 30,
            ),
            CustomHomeViewSection2(
              isStaySelected: isStaySelected,
              isCarRentalSelected: isCarRentalSelected,
              isBoatCruiseSelected: isBoatCruiseSelected,
            ),

            ///section 3:
            isStaySelected
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomHeight(height: 30),
                      CustomSectionHeader(
                        mainText: "Popular destinations",
                        onTapSeeAll: () {
                          if (isStaySelected) {
                            AppNagivator.pushRoute(
                              context,
                              (context) => SeeMoreView(
                                headingText: "Popular Destinations",
                                subText:
                                    "Here is the comprehensive list of all popular destinations \ncurated just for you",
                                serviceType: LocalDatabase.destinationService,
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
                : const CustomHeight(height: 30),

            ///section 4:
            CustomHomeViewSection4(
              isStaySelected: isStaySelected,
              isCarRentalSelected: isCarRentalSelected,
              isBoatCruiseSelected: isBoatCruiseSelected,
            )
          ],
        ),
      ),
    );
  }

  void _updateBasedOnStay() {
    setState(
      () {
        isStaySelected = true;
        isCarRentalSelected = false;
        isBoatCruiseSelected = false;

        if (isStaySelected) {
          stayBorderColor = AppColors.appMainColor;
          carRentalBorderColor = Colors.grey.shade200;
          boatCruiseBorderColor = Colors.grey.shade200;

          stayTextAndIconColor = AppColors.appMainColor;
          carRentalTextAndIconColor = AppColors.appTextFadedColor;
          boatCruiseTextAndIconColor = AppColors.appTextFadedColor;

          stayFontWeight = FontWeight.bold;
          carRentalFontWeight = FontWeight.normal;
          boatCruiseFontWeight = FontWeight.normal;
        }
      },
    );
  }

  void _updateBasedOnRentBoats() {
    isStaySelected = false;
    isCarRentalSelected = false;
    isBoatCruiseSelected = true;

    if (isBoatCruiseSelected) {
      boatCruiseBorderColor = AppColors.appMainColor;
      carRentalBorderColor = Colors.grey.shade200;
      stayBorderColor = Colors.grey.shade200;

      boatCruiseTextAndIconColor = AppColors.appMainColor;
      carRentalTextAndIconColor = AppColors.appTextFadedColor;
      stayTextAndIconColor = AppColors.appTextFadedColor;

      stayFontWeight = FontWeight.normal;
      carRentalFontWeight = FontWeight.normal;
      boatCruiseFontWeight = FontWeight.bold;
    }

    setState(() {});
  }

  void _updateBasedOnRentCars() {
    isStaySelected = false;
    isCarRentalSelected = true;
    isBoatCruiseSelected = false;

    if (isCarRentalSelected) {
      carRentalBorderColor = AppColors.appMainColor;
      stayBorderColor = Colors.grey.shade200;
      boatCruiseBorderColor = Colors.grey.shade200;

      carRentalTextAndIconColor = AppColors.appMainColor;
      stayTextAndIconColor = AppColors.appTextFadedColor;
      boatCruiseTextAndIconColor = AppColors.appTextFadedColor;

      stayFontWeight = FontWeight.normal;
      carRentalFontWeight = FontWeight.bold;
      boatCruiseFontWeight = FontWeight.normal;
    }

    setState(() {});
  }
}
