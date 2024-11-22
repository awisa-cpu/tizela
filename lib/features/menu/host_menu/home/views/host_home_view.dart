import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_home_header_section.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_tab_button_with_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_car_rental_or_boat_cruise_bookings_tab.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_shorlet_bookings_tab.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_analytics_tab.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_header_text_with_action_button.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_home_listing_indication.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_home_stat_filter_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/empty_listing_view.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/host_home_total_earnings_view.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class HostHomeView extends StatefulWidget {
  const HostHomeView({super.key});

  @override
  State<HostHomeView> createState() => _HostHomeViewState();
}

class _HostHomeViewState extends State<HostHomeView> {
  late bool isShorletSelected;
  bool isCarRentalSelected = false;
  bool isBoatCruiseSelected = false;
  bool updateDetails = false;
  late bool onTapYesConfirm;

  //color
  late Color shorletTextAndIconColor;
  Color carRentalTextAndIconColor =
      AppColors.appTextFadedColor.withOpacity(0.8);
  Color boatCruiseTextAndIconColor =
      AppColors.appTextFadedColor.withOpacity(0.8);

  late Color shorletmainAndBorderColor;
  Color carRentalmainAndBorderColor = AppColors.appWhiteColor;
  Color boatCruisemainAndBorderColor = AppColors.appWhiteColor;

  @override
  void initState() {
    onTapYesConfirm = false;
    super.initState();

    //
    isShorletSelected = true;
    shorletTextAndIconColor = AppColors.appWhiteColor;
    shorletmainAndBorderColor = AppColors.appMainColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        child: CustomColumn(
          children: [
            const CustomHeight(height: 50),

            ///section 1
            const CustomHomeHeaderSection(
              userType: "Host",
            ),
            const CustomHeight(height: 30),

            //view for listing indication
            if (updateDetails) const CustomHostHomeListingIndication(),

            //selection 2: Selectable tabs
            CustomColumn(
              children: [
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomTabButtonWithIconAndText(
                        text: "Shorlet",
                        imageUrl: ImagesText.buildingIcon,
                        textIconAndBorderColor: shorletTextAndIconColor,
                        mainColor: shorletmainAndBorderColor,
                        onTap: _onShorletChange,
                      ),
                      CustomTabButtonWithIconAndText(
                        text: "Car rental",
                        imageUrl: ImagesText.carIcon,
                        textIconAndBorderColor: carRentalTextAndIconColor,
                        mainColor: carRentalmainAndBorderColor,
                        onTap: _onCarRentalChange,
                      ),
                      CustomTabButtonWithIconAndText(
                        text: "Boat cruise",
                        imageUrl: ImagesText.shipIcon,
                        textIconAndBorderColor: boatCruiseTextAndIconColor,
                        mainColor: boatCruisemainAndBorderColor,
                        onTap: _onBoatCruiseChange,
                      ),
                    ],
                  ),
                ),
                const CustomHeight(height: 35),
              ],
            ),

            //
            isCarRentalSelected
                ? const EmptyListingView(
                    mainText: "No Listing Yet",
                    subText:
                        "Click the button below to create listing\n for your service",
                  )
                : CustomColumn(
                    children: [
                      if (!onTapYesConfirm)
                        CustomHostHomeConfirmationCard(
                          onTapNoEdit: () {},
                          onTapYesConfirm: () {
                            setState(() {
                              onTapYesConfirm = true;
                            });
                          },
                        ),

                      ///section 3: statistics section
                      CustomColumn(
                        children: [
                          //first part:
                          CustomHostHomeStatFilterView(
                            title: "Stats",
                            dropdownvalue: "This Month",
                            menuItems: const [
                              "This Month",
                              "Last Month",
                              "2 month ago"
                            ],
                            onItemChanged: (newValue) {},
                          ),
                          const CustomHeight(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomAnalyticsTab(
                                headerText: "Total listing",
                                itemCount: "1",
                                onTap: () {},
                              ),
                              CustomAnalyticsTab(
                                headerText: "Total booking",
                                itemCount: "3",
                                onTap: () {},
                              ),
                            ],
                          ),
                          const CustomHeight(height: 25),
                          CustomAnalyticsTab(
                            headerText: "Total Earning",
                            itemCount: "#188,000.00",
                            width: context.screenWidth(),
                            onTap: () {
                              AppNagivator.pushRoute(
                                context,
                                (_) => const HostHomeTotalEarningsView(),
                              );
                            },
                          ),
                          const CustomHeight(height: 25),
                        ],
                      ),

                      ///section 4: action data
                      CustomColumn(
                        children: [
                          CustomHostHeaderTextWithActionButton(
                            title: "Recent bookings",
                            count: "3",
                            onTap: () {
                              AppNagivator.pushRoute(
                                context,
                                (_) => const HostHomeTotalEarningsView(),
                              );
                            },
                          ),
                          if (isShorletSelected)
                            CustomListview(
                              itemCount: 2,
                              itemBuilder: (_, index) {
                                return const CustomHostShorletBookingsTab(
                                  isOngoing: true,
                                  stateColor: Colors.transparent,
                                );
                              },
                            ),
                          if (isCarRentalSelected)
                            CustomListview(
                              itemCount: 2,
                              itemBuilder: (_, index) {
                                return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                                  isOngoing: true,
                                  stateColor: Colors.transparent,
                                  imageUrl: ImagesText.bmwCar,
                                );
                              },
                            ),

                          //
                          if (isBoatCruiseSelected)
                            CustomListview(
                              itemCount: 2,
                              itemBuilder: (_, index) {
                                return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                                  isOngoing: true,
                                  stateColor: Colors.transparent,
                                  imageUrl: ImagesText.ship1,
                                );
                              },
                            ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  void _onShorletChange() {
    setState(() {
      isShorletSelected = true;
      isCarRentalSelected = false;
      isBoatCruiseSelected = false;

      if (isShorletSelected) {
        shorletTextAndIconColor = AppColors.appWhiteColor;
        shorletmainAndBorderColor = AppColors.appMainColor;

        //
        carRentalTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);

        //
        carRentalmainAndBorderColor = AppColors.appWhiteColor;
        boatCruisemainAndBorderColor = AppColors.appWhiteColor;
      }
    });
  }

  void _onCarRentalChange() {
    setState(() {
      isShorletSelected = false;
      isCarRentalSelected = true;
      isBoatCruiseSelected = false;

      if (isCarRentalSelected) {
        shorletTextAndIconColor = AppColors.appTextFadedColor.withOpacity(0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor = AppColors.appWhiteColor;
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);

        //
        carRentalmainAndBorderColor = AppColors.appMainColor;
        boatCruisemainAndBorderColor = AppColors.appWhiteColor;
      }
    });
  }

  void _onBoatCruiseChange() {
    setState(() {
      isShorletSelected = false;
      isCarRentalSelected = false;
      isBoatCruiseSelected = true;

      if (isBoatCruiseSelected) {
        shorletTextAndIconColor = AppColors.appTextFadedColor.withOpacity(0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor =
            AppColors.appTextFadedColor.withOpacity(0.8);
        boatCruiseTextAndIconColor = AppColors.appWhiteColor;

        //
        carRentalmainAndBorderColor = AppColors.appWhiteColor;
        boatCruisemainAndBorderColor = AppColors.appMainColor;
      }
    });
  }
}

class CustomHostHomeConfirmationCard extends StatelessWidget {
  final VoidCallback onTapNoEdit, onTapYesConfirm;
  const CustomHostHomeConfirmationCard({
    super.key,
    required this.onTapNoEdit,
    required this.onTapYesConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomRoundedEdgedContainer(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5.0,
              spreadRadius: 6.0,
              offset: const Offset(2, 2),
            )
          ],
          showBorder: false,
          paddingNumber: 30,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: CustomColumn(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesText.infoCircleIcon,
                    height: 20,
                  ),
                  const CustomWidth(width: 15),
                  CustomColumn(
                    children: [
                      Text(
                        "Kindly confirm your listings are",
                        textAlign: TextAlign.justify,
                        style: customTextStyle(),
                      ),
                      Text(
                        "available to guest today",
                        textAlign: TextAlign.justify,
                        style: customTextStyle(),
                      ),
                    ],
                  )
                ],
              ),
              const CustomHeight(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapNoEdit,
                      child: Text(
                        "No, edit availability",
                        style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapYesConfirm,
                      child: Text(
                        "Yes, confirm",
                        style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(right: 0, top: 20, child: Image.asset(ImagesText.pattern1)),
        Positioned(
          bottom: 21,
          left: 0,
          child: Image.asset(
            ImagesText.pattern2,
          ),
        ),
        Positioned(right: 0, top: 20, child: Image.asset(ImagesText.pattern3)),
      ],
    );
  }
}
