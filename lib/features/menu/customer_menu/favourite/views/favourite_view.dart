import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/common/widgets/custom_sliver_and_tab_bar_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_tab.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_shorlet.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../common/styles/custom_scrollable_layout_widget.dart';
import '../../../../../utils/loaders/app_future_loaders.dart';
import '../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../home/views/widgets/single_boat_cruise.dart';
import '../../home/views/widgets/single_car_rental.dart';
import '../controller/custom_boat_cruise_favourite_controller.dart';
import '../controller/custom_car_rental_favourite_controller.dart';
import '../controller/customer_shortlet_favourite_controller.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final shortletFavCon = CustomShortletFavouriteController.instance;
    final carRentalFavCon = CustomCarRentalFavouriteController.instance;
    final boatCruiseFavCon = CustomBoatCruiseFavouriteController.instance;

    //
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
              CustomScrollableLayoutWidget(
                child: FutureBuilder(
                  future: shortletFavCon.fetchShortletsFavouritesWithIds(),
                  builder: (context, snapshot) {
                    final widgetToDisplay =
                        AppFutureLoaders.checkMultiFutureState(
                      snapshot: snapshot,
                      loaderWidget: const CustomHostDataShimmerListView(),
                    );

                    if (widgetToDisplay != null) {
                      return widgetToDisplay;
                    }

                    final favShortlets = snapshot.data!;

                    return CustomListview(
                      itemCount: favShortlets.length,
                      itemBuilder: (_, index) {
                        final favShortlet = favShortlets[index];

                        return SingleShortlet(
                          shortlet: favShortlet,
                        );
                      },
                    );
                  },
                ),
              ),
              CustomScrollableLayoutWidget(
                child: FutureBuilder(
                  future: carRentalFavCon.fetchCarRentalFavouritesWithIds(),
                  builder: (context, snapshot) {
                    final widgetToDisplay =
                        AppFutureLoaders.checkMultiFutureState(
                      snapshot: snapshot,
                      loaderWidget: const CustomHostDataShimmerListView(),
                    );

                    if (widgetToDisplay != null) {
                      return widgetToDisplay;
                    }

                    final favCarRentals = snapshot.data!;

                    return CustomListview(
                      itemCount: favCarRentals.length,
                      itemBuilder: (_, index) {
                        final favCarRental = favCarRentals[index];

                        return SingleCarRental(
                          carRental: favCarRental,
                        );
                      },
                    );
                  },
                ),
              ),
              CustomScrollableLayoutWidget(
                child: FutureBuilder(
                  future: boatCruiseFavCon.fetchBoatCruiseFavouritesWithIds(),
                  builder: (context, snapshot) {
                    final widgetToDisplay =
                        AppFutureLoaders.checkMultiFutureState(
                      snapshot: snapshot,
                      loaderWidget: const CustomHostDataShimmerListView(),
                    );

                    if (widgetToDisplay != null) {
                      return widgetToDisplay;
                    }

                    final favBoatCruises = snapshot.data!;

                    return CustomListview(
                      itemCount: favBoatCruises.length,
                      itemBuilder: (_, index) {
                        final favBoatCruise = favBoatCruises[index];

                        return SingleBoatCruise(
                          boatCruse: favBoatCruise,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
