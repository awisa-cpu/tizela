import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_tab.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../../../../common/widgets/widgets.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/loaders/app_future_loaders.dart';
import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../controller/boat_cruise_bookings_controller.dart';
import 'widgets/custom_boat_cruse_booking_status.dart';

class BoatCruiseBookingTabSectionView extends StatelessWidget {
  const BoatCruiseBookingTabSectionView({super.key});

  //
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BoatCruiseBookingsController());

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        isMainAxisSize: false,
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
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBookingTab(
                      text: "Active",
                      textColor: controller.activeTextColor.value,
                      tabColor: controller.activeTabColor.value,
                      onTap: controller.activeSelected,
                    ),
                    CustomBookingTab(
                      text: "Completed",
                      textColor: controller.completedTextColor.value,
                      tabColor: controller.completedTabColor.value,
                      onTap: controller.completedSelected,
                      width: 120,
                    ),
                    CustomBookingTab(
                      text: "Cancelled",
                      textColor: controller.cancelledTextColor.value,
                      tabColor: controller.cancelledTabColor.value,
                      onTap: controller.cancelledSelected,
                      width: 120,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const CustomHeight(height: 20),
          Obx(
            () {
              return controller.isActiveSelected.value
                  ? FutureBuilder(
                      future: controller.fetchBoatCruiseBookingsByStatus(
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

                        final boatCruiseBookings = snapshot.data!;

                        //
                        return CustomListview(
                          itemCount: boatCruiseBookings.length,
                          itemBuilder: (_, index) {
                            final booking = boatCruiseBookings[index];

                            return CustomBoatCruseBookingStatus(
                              boatCruiseBooking: booking,
                              statusColor: AppColors.appMainColor,
                              isActive: true,
                              isCompleted: false,
                              isCancelled: true,
                            );
                          },
                        );
                      },
                    )
                  : controller.isCompletedSelected.value
                      ? FutureBuilder(
                          future: controller.fetchBoatCruiseBookingsByStatus(
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

                            final boatCruiseBookings = snapshot.data!;

                            //
                            return CustomListview(
                              itemCount: boatCruiseBookings.length,
                              itemBuilder: (_, index) {
                                final booking = boatCruiseBookings[index];

                                return CustomBoatCruseBookingStatus(
                                  boatCruiseBooking: booking,
                                  statusColor: Colors.green,
                                  isActive: false,
                                  isCompleted: true,
                                  isCancelled: false,
                                );
                              },
                            );
                          },
                        )
                      : controller.isCancelledSelected.value
                          ? FutureBuilder(
                              future:
                                  controller.fetchBoatCruiseBookingsByStatus(
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

                                final boatCruiseBookings = snapshot.data!;

                                //
                                return CustomListview(
                                  itemCount: boatCruiseBookings.length,
                                  itemBuilder: (_, index) {
                                    final booking = boatCruiseBookings[index];

                                    return CustomBoatCruseBookingStatus(
                                      boatCruiseBooking: booking,
                                      statusColor: Colors.red,
                                      isActive: false,
                                      isCompleted: false,
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
