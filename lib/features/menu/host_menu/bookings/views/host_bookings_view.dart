import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_empty_data_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_tab_button_with_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_booking_tabs.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_car_rental_or_boat_cruise_bookings_tab.dart';
import 'package:tizela/features/menu/host_menu/bookings/views/widget/custom_host_shorlet_bookings_tab.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class HostBookingsView extends StatefulWidget {
  const HostBookingsView({super.key});

  @override
  State<HostBookingsView> createState() => _HostBookingsViewState();
}

class _HostBookingsViewState extends State<HostBookingsView> {
  late bool isShorletSelected;
  bool isCarRentalSelected = false;
  bool isBoatCruiseSelected = false;

  //color
  late Color shorletTextAndIconColor;
  Color carRentalTextAndIconColor =
      AppColors.appTextFadedColor.withValues(alpha: 0.8);
  Color boatCruiseTextAndIconColor =
      AppColors.appTextFadedColor.withValues(alpha: 0.8);

  late Color shorletmainAndBorderColor;
  Color carRentalmainAndBorderColor = AppColors.appWhiteColor;
  Color boatCruisemainAndBorderColor = AppColors.appWhiteColor;

//
  late bool isOngoingSelected;
  bool isCompletedSelected = false;
  bool isCancelledSelected = false;

  Color _onGoingBorderColor = AppColors.appMainColor;
  Color completedBorderColor = const Color(0xFF878787);
  Color cancelledBorderColor = const Color(0xFF878787);

  //
  late double _onGoingTextSize;
  double completedTextSize = 14.0;
  double cancelledTextSize = 14.0;

  //
  late double onGoingWidth;
  double completedWidth = 1.0;
  double cancelledWidth = 1.0;

  @override
  void initState() {
    super.initState();
    isOngoingSelected = true;
    _onGoingBorderColor = AppColors.appMainColor;
    _onGoingTextSize = 16.0;
    onGoingWidth = 2.0;

    //
    isShorletSelected = true;
    shorletTextAndIconColor = AppColors.appWhiteColor;
    shorletmainAndBorderColor = AppColors.appMainColor;
  }

  //fetches and display all bookings (shorlet-carRental & Boat Cruise)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: EdgeInsets.only(
          left: 13.5,
          top: context.appBarHeight(),
        ),
        child: CustomColumn(
          children: [
            //first section: main tabs
            SizedBox(
              height: 55,
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

            if (isShorletSelected)
              CustomColumn(
                children: [
                  //second section: with tabs
                  CustomHostBookingTabs(
                    onGoingChange: _onOngoingChange,
                    onCompletedChange: _onCompletedChange,
                    onCancelledChange: _onCancelledChange,
                    onGoingBorderColor: _onGoingBorderColor,
                    completedBorderColor: completedBorderColor,
                    cancelledBorderColor: cancelledBorderColor,
                    onGoingWidth: onGoingWidth,
                    onGoingTextSize: _onGoingTextSize,
                    completedWidth: completedWidth,
                    completedTextSize: completedTextSize,
                    cancelledWidth: cancelledWidth,
                    cancelledTextSize: cancelledTextSize,
                    onGoingCount: 2,
                    completedCount: 1,
                    cancelledCount: 0,
                  ),

                  //: bookings will be sorted into various tabs based on their states
                  if (isOngoingSelected)
                    CustomListview(
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        return const CustomHostShorletBookingsTab(
                          isOngoing: true,
                          stateColor: Colors.green,
                        );
                      },
                    ),

                  if (isCompletedSelected)
                    CustomListview(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return const CustomHostShorletBookingsTab(
                          isOngoing: false,
                          stateColor: Color(0xFFFFC107),
                        );
                      },
                    ),

                  if (isCancelledSelected)
                    const CustomEmptyDataView(
                      mainText: " No cancelled order",
                      subText:
                          " Always update your listing availability to\n avoid cancelling a reservation",
                    )
                ],
              ),

            if (isCarRentalSelected)
              CustomColumn(
                children: [
                  //second section: with tabs
                  CustomHostBookingTabs(
                    onGoingChange: _onOngoingChange,
                    onCompletedChange: _onCompletedChange,
                    onCancelledChange: _onCancelledChange,
                    onGoingBorderColor: _onGoingBorderColor,
                    completedBorderColor: completedBorderColor,
                    cancelledBorderColor: cancelledBorderColor,
                    onGoingWidth: onGoingWidth,
                    onGoingTextSize: _onGoingTextSize,
                    completedWidth: completedWidth,
                    completedTextSize: completedTextSize,
                    cancelledWidth: cancelledWidth,
                    cancelledTextSize: cancelledTextSize,
                    onGoingCount: 2,
                    completedCount: 2,
                    cancelledCount: 0,
                  ),

                  //: bookings will be sorted into various tabs based on their states
                  if (isOngoingSelected)
                    CustomListview(
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                          isOngoing: true,
                          stateColor: Colors.green,
                          imageUrl: ImagesText.bmwCar,
                        );
                      },
                    ),

                  if (isCompletedSelected)
                    CustomListview(
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                          isOngoing: false,
                          stateColor: Color(0xFFFFC107),
                          imageUrl: ImagesText.volksCar,
                        );
                      },
                    ),

                  if (isCancelledSelected)
                    const CustomEmptyDataView(
                      mainText: " No cancelled order",
                      subText:
                          " Always update your listing availability to\n avoid cancelling a reservation",
                    )
                ],
              ),

            //
            if (isBoatCruiseSelected)
              CustomColumn(
                children: [
                  //second section: with tabs
                  CustomHostBookingTabs(
                    onGoingChange: _onOngoingChange,
                    onCompletedChange: _onCompletedChange,
                    onCancelledChange: _onCancelledChange,
                    onGoingBorderColor: _onGoingBorderColor,
                    completedBorderColor: completedBorderColor,
                    cancelledBorderColor: cancelledBorderColor,
                    onGoingWidth: onGoingWidth,
                    onGoingTextSize: _onGoingTextSize,
                    completedWidth: completedWidth,
                    completedTextSize: completedTextSize,
                    cancelledWidth: cancelledWidth,
                    cancelledTextSize: cancelledTextSize,
                    onGoingCount: 2,
                    completedCount: 2,
                    cancelledCount: 1,
                  ),

                  //: bookings will be sorted into various tabs based on their states
                  if (isOngoingSelected)
                    CustomListview(
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                          isOngoing: true,
                          stateColor: Colors.green,
                          imageUrl: ImagesText.ship1,
                        );
                      },
                    ),

                  if (isCompletedSelected)
                    CustomListview(
                      itemCount: 2,
                      itemBuilder: (_, index) {
                        return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                          isOngoing: false,
                          stateColor: Color(0xFFFFC107),
                          imageUrl: ImagesText.ship2,
                        );
                      },
                    ),

                  if (isCancelledSelected)
                    CustomListview(
                      itemCount: 1,
                      itemBuilder: (_, index) {
                        return const CustomHostCarRentalOrBoatCruiseBookingsTab(
                          isOngoing: false,
                          stateColor: Color(0xFFA50707),
                          imageUrl: ImagesText.ship3,
                        );
                      },
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
            AppColors.appTextFadedColor.withValues(alpha: 0.8);
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withValues(alpha: 0.8);

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
        shorletTextAndIconColor =
            AppColors.appTextFadedColor.withValues(alpha: 0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor = AppColors.appWhiteColor;
        boatCruiseTextAndIconColor =
            AppColors.appTextFadedColor.withValues(alpha: 0.8);

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
        shorletTextAndIconColor =
            AppColors.appTextFadedColor.withValues(alpha: 0.8);
        shorletmainAndBorderColor = AppColors.appWhiteColor;

        //
        carRentalTextAndIconColor =
            AppColors.appTextFadedColor.withValues(alpha: 0.8);
        boatCruiseTextAndIconColor = AppColors.appWhiteColor;

        //
        carRentalmainAndBorderColor = AppColors.appWhiteColor;
        boatCruisemainAndBorderColor = AppColors.appMainColor;
      }
    });
  }

  void _onOngoingChange() {
    setState(() {
      isOngoingSelected = true;
      isCompletedSelected = false;
      isCancelledSelected = false;

      if (isOngoingSelected) {
        _onGoingBorderColor = AppColors.appMainColor;
        _onGoingTextSize = 16.0;
        onGoingWidth = 2.0;

        //
        completedBorderColor = const Color(0xFF878787);
        completedTextSize = 14.0;
        completedWidth = 1.0;

        //
        cancelledBorderColor = const Color(0xFF878787);
        cancelledTextSize = 14.0;
        cancelledWidth = 1.0;
      }
    });
  }

  void _onCompletedChange() {
    setState(() {
      isOngoingSelected = false;
      isCompletedSelected = true;
      isCancelledSelected = false;

      if (isCompletedSelected) {
        _onGoingBorderColor = const Color(0xFF878787);
        _onGoingTextSize = 14.0;
        onGoingWidth = 1.0;

        //
        completedBorderColor = AppColors.appMainColor;
        completedTextSize = 16.0;
        completedWidth = 2.0;

        //
        cancelledBorderColor = const Color(0xFF878787);
        cancelledTextSize = 14.0;
        cancelledWidth = 1.0;
      }
    });
  }

  void _onCancelledChange() {
    setState(() {
      isOngoingSelected = false;
      isCompletedSelected = false;
      isCancelledSelected = true;

      if (isCancelledSelected) {
        _onGoingBorderColor = const Color(0xFF878787);
        _onGoingTextSize = 14.0;
        onGoingWidth = 1.0;

        //
        completedBorderColor = const Color(0xFF878787);
        completedTextSize = 14.0;
        completedWidth = 1.0;

        //
        cancelledBorderColor = AppColors.appMainColor;
        cancelledTextSize = 16.0;
        cancelledWidth = 2.0;
      }
    });
  }
}
