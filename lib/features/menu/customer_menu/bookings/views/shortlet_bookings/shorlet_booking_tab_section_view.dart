import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/shortlet_bookings/widgets/custom_shorlet_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_tab.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../utils/loaders/app_future_loaders.dart';
import '../../../../../../utils/shimmers/custom_data_shimmer_list_view.dart';
import '../../controller/shortlet_bookings_controller.dart';

class ShorletBookingTabSectionView extends StatelessWidget {
  const ShorletBookingTabSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShortletBookingsController());

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

              //section one
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

              //section two
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CustomBookingTab(
                      text: "Active",
                      textColor: controller.activeTextColor.value,
                      tabColor: controller.activeTabColor.value,
                      onTap: controller.activeSelected,
                    ),
                  ),
                  Obx(
                    () => CustomBookingTab(
                      text: "Completed",
                      textColor: controller.completedTextColor.value,
                      tabColor: controller.completedTabColor.value,
                      onTap: controller.completedSelected,
                      width: 120,
                    ),
                  ),
                  Obx(
                    () => CustomBookingTab(
                      text: "Cancelled",
                      textColor: controller.cancelledTextColor.value,
                      tabColor: controller.cancelledTabColor.value,
                      onTap: controller.cancelledSelected,
                      width: 120,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Obx(
            () {
              return controller.isActiveSelected.value
                  ? FutureBuilder(
                      future: controller.fetchBookingsByStatus(status: 'paid'),
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

                        final shortletBookings = snapshot.data!;

                        //
                        return CustomListview(
                          itemCount: shortletBookings.length,
                          itemBuilder: (_, index) {
                            final booking = shortletBookings[index];

                            return CustomShorletBookingStatus(
                              bookingModel: booking,
                              statusColor: AppColors.appMainColor,
                              isActive: true,
                              isCompleted: false,
                              isCancelled: false,
                            );
                          },
                        );
                      },
                    )
                  : controller.isCompletedSelected.value
                      ? FutureBuilder(
                          future: controller.fetchBookingsByStatus(
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

                            final shortletBookings = snapshot.data!;
                            return CustomListview(
                              itemCount: shortletBookings.length,
                              itemBuilder: (_, index) {
                                final booking = shortletBookings[index];

                                return CustomShorletBookingStatus(
                                  bookingModel: booking,
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
                              future: controller.fetchBookingsByStatus(
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

                                final shortletBookings = snapshot.data!;
                                return CustomListview(
                                  itemCount: shortletBookings.length,
                                  itemBuilder: (_, index) {
                                    final booking = shortletBookings[index];

                                    return CustomShorletBookingStatus(
                                      bookingModel: booking,
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
          ),
        ],
      ),
    );
  }
}
