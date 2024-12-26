import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_car_rental_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_shorlet_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_data_view_widget.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_tab_button_with_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_add_listing_button.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_single_boat_cruise.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_single_car_rental.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_single_shorlet.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/shimmers%20&%20loaders/custom_shorlets_shimmer_list_view.dart';
import '../../../../../../utils/shimmers & loaders/app_stream_loaders.dart';
import '../new_listing/boat_cruise/host_new_listing_boat_cruise_view.dart';
import '../new_listing/car_rental/host_new_listing_car_rental_view.dart';
import '../new_listing/shorlet/host_new_listing_shorlet_view.dart';

class HostListingsView extends StatefulWidget {
  const HostListingsView({super.key});

  @override
  State<HostListingsView> createState() => _HostListingsViewState();
}

class _HostListingsViewState extends State<HostListingsView> {
  late bool _isShorletSelected;
  bool _isCarRentalSelected = false;
  bool _isBoatCruiseSelected = false;

  //
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
  @override
  void initState() {
    super.initState();

    //
    _isShorletSelected = true;
    shorletTextAndIconColor = AppColors.appWhiteColor;
    shorletmainAndBorderColor = AppColors.appMainColor;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HostShorletController());
    Get.put(HostCarRentalController());
    Get.put(HostBoatCruiseController());

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          children: [
            const CustomHeight(height: 50),
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

            CustomHostAddListingButton(
              onTap: _createNewListing,
            ),

            const CustomHeight(height: 30),

            //shorlet selected
            if (_isShorletSelected)
              StreamBuilder(
                stream: HostShorletController.instance.fetchShortletsAsStream(),
                builder: (context, snapshot) {
                  //check state
                  final response = AppStreamLoaders.checkMultiStreamState(
                    snapshot: snapshot,
                    loaderWidget: const CustomHostDataShimmerListView(),
                  );

                  if (response != null) return response;

                  //there is data
                  final shorlets = snapshot.data!;

                  return CustomDataViewWidget(
                    totalItemCount: shorlets.length,
                    onSearchTap: () {},
                    itemBuilder: (_, index) {
                      final shortletItem = shorlets[index];

                      return CustomHostSingleShorlet(
                        shorlet: shortletItem,
                      );
                    },
                  );
                },
              ),

            if (_isCarRentalSelected)
              StreamBuilder(
                stream:
                    HostCarRentalController.instance.fetchCarRentalsAsStream(),
                builder: (context, snapshot) {
                  //check state
                  final response = AppStreamLoaders.checkMultiStreamState(
                    snapshot: snapshot,
                    loaderWidget: const CustomHostDataShimmerListView(),
                  );

                  if (response != null) return response;
                  //there is data
                  final carRentals = snapshot.data!;

                  return CustomDataViewWidget(
                    totalItemCount: carRentals.length,
                    onSearchTap: () {},
                    itemBuilder: (_, index) {
                      final carRentalItem = carRentals[index];
                      return CustomHostSingleCarRental(
                        carRental: carRentalItem,
                      );
                    },
                  );
                },
              ),

            if (_isBoatCruiseSelected)
              StreamBuilder(
                stream: HostBoatCruiseController.instance
                    .fetchBoatCruisesAsStream(),
                builder: (context, snapshot) {
                  //check state
                  final response = AppStreamLoaders.checkMultiStreamState(
                    snapshot: snapshot,
                    loaderWidget: const CustomHostDataShimmerListView(),
                  );

                  if (response != null) return response;
                  //there is data

                  final boatCruiseList = snapshot.data!;

                  return CustomDataViewWidget(
                    totalItemCount: boatCruiseList.length,
                    onSearchTap: () {},
                    itemBuilder: (_, index) {
                      final boatCruiseItem = boatCruiseList[index];
                      return CustomHostSingleBoatCruise(
                        boatCruise: boatCruiseItem,
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _createNewListing() {
    if (_isShorletSelected) {
      Get.to(() => const HostNewListingShorletView());
    } else if (_isCarRentalSelected) {
      Get.to(() => const HostNewListingCarRentalView());
    } else if (_isBoatCruiseSelected) {
      Get.to(() => const HostNewListingBoatCruiseView());
    }
  }

  void _onShorletChange() {
    setState(() {
      _isShorletSelected = true;
      _isCarRentalSelected = false;
      _isBoatCruiseSelected = false;

      if (_isShorletSelected) {
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
      _isShorletSelected = false;
      _isCarRentalSelected = true;
      _isBoatCruiseSelected = false;

      if (_isCarRentalSelected) {
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
      _isShorletSelected = false;
      _isCarRentalSelected = false;
      _isBoatCruiseSelected = true;

      if (_isBoatCruiseSelected) {
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
}
