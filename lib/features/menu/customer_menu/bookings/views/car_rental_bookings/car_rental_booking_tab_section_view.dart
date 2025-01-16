import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_tab.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../common/widgets/widgets.dart';
import '../../../../../../utils/loaders/app_future_loaders.dart';
import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../controller/car_rental_bookings_controller.dart';
import 'widgets/custom_car_rental_booking_status.dart';

class CarRentalBookingTabSectionView extends StatelessWidget {
  const CarRentalBookingTabSectionView({super.key});

  //
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarRentalBookingsController());

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        isMainAxisSize: false,
        spacing: 20,
        children: [
          //first section
          CustomColumn(
            children: [
              const CustomHeight(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My bookings",
                    style: customTextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () =>
                        AppNagivator.pushNamedRoute(bookingSearchRoute),
                    child: Image.asset(ImagesText.searchIcon),
                  ),
                ],
              ),
              const CustomHeight(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CustomBookingTab(
                      text: "Active",
                      textColor: controller.activeTextColor.value,
                      tabColor: controller.activeTabColor.value,
                      onTap: controller.activeCRBSelected,
                    ),
                  ),
                  Obx(
                    () => CustomBookingTab(
                      text: "Completed",
                      textColor: controller.completedTextColor.value,
                      tabColor: controller.completedTabColor.value,
                      onTap: controller.completedCRBSelected,
                      width: 120,
                    ),
                  ),
                  Obx(
                    () => CustomBookingTab(
                      text: "Cancelled",
                      textColor: controller.cancelledTextColor.value,
                      tabColor: controller.cancelledTabColor.value,
                      onTap: controller.cancelledCRBSelected,
                      width: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Obx(
            () {
              return controller.isCRBActiveSelected.value
                  ? FutureBuilder(
                      future: controller.fetchCarRentalBookingsByStatus(
                          status: 'paid'),
                      builder: (context, snapshot) {
                        //
                        final widgetToDisplay =
                            AppFutureLoaders.checkMultiFutureState(
                          snapshot: snapshot,
                          loaderWidget: const CustomHostDataShimmerListView(),
                          nothingFoundWidget: const CustomEmptyDataView(
                            mainText: "No Bookings",
                            subText:
                                "You don't have any upcoming bookings yet, click\n on home to get started",
                          ),
                        );

                        if (widgetToDisplay != null) return widgetToDisplay;

                        final carRentalBookings = snapshot.data!;

                        //
                        return CustomListview(
                          itemCount: carRentalBookings.length,
                          itemBuilder: (_, index) {
                            final booking = carRentalBookings[index];

                            return CustomCarRentalBookingStatus(
                              bookingCarRental: booking,
                              statusColor: AppColors.appMainColor,
                              isActive: true,
                              isComplete: false,
                              isCancelled: false,
                            );
                          },
                        );
                      },
                    )
                  : controller.isCRBCancelledSelected.value
                      ? FutureBuilder(
                          future: controller.fetchCarRentalBookingsByStatus(
                              status: 'completed'),
                          builder: (context, snapshot) {
                            //
                            final widgetToDisplay =
                                AppFutureLoaders.checkMultiFutureState(
                              snapshot: snapshot,
                              loaderWidget:
                                  const CustomHostDataShimmerListView(),
                              nothingFoundWidget: const CustomEmptyDataView(
                                mainText: "No Bookings",
                                subText:
                                    "You don't have any upcoming bookings yet, click\n on home to get started",
                              ),
                            );

                            if (widgetToDisplay != null) return widgetToDisplay;

                            final carRentalBookings = snapshot.data!;

                            //
                            return CustomListview(
                              itemCount: carRentalBookings.length,
                              itemBuilder: (_, index) {
                                final booking = carRentalBookings[index];

                                return CustomCarRentalBookingStatus(
                                  bookingCarRental: booking,
                                  statusColor: AppColors.appMainColor,
                                  isActive: false,
                                  isComplete: true,
                                  isCancelled: false,
                                );
                              },
                            );
                          },
                        )
                      : controller.isCRBCompletedSelected.value
                          ? FutureBuilder(
                              future: controller.fetchCarRentalBookingsByStatus(
                                  status: 'cancelled'),
                              builder: (context, snapshot) {
                                //
                                final widgetToDisplay =
                                    AppFutureLoaders.checkMultiFutureState(
                                  snapshot: snapshot,
                                  loaderWidget:
                                      const CustomHostDataShimmerListView(),
                                  nothingFoundWidget: const CustomEmptyDataView(
                                    mainText: "No Bookings",
                                    subText:
                                        "You don't have any upcoming bookings yet, click\n on home to get started",
                                  ),
                                );

                                if (widgetToDisplay != null) {
                                  return widgetToDisplay;
                                }

                                final carRentalBookings = snapshot.data!;

                                //
                                return CustomListview(
                                  itemCount: carRentalBookings.length,
                                  itemBuilder: (_, index) {
                                    final booking = carRentalBookings[index];

                                    return CustomCarRentalBookingStatus(
                                      bookingCarRental: booking,
                                      statusColor: AppColors.appMainColor,
                                      isActive: false,
                                      isComplete: false,
                                      isCancelled: true,
                                    );
                                  },
                                );
                              },
                            )
                          : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
