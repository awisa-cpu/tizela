import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/boat_cruise_booking_model.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_bookings_receipt_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';

class CustomBoatCruseBookingStatus extends StatelessWidget {
  final BoatCruiseBookingModel boatCruiseBooking;
  final Color statusColor;
  final bool isActive, isCompleted, isCancelled;
  const CustomBoatCruseBookingStatus({
    super.key,
    required this.statusColor,
    required this.isActive,
    required this.isCompleted,
    required this.isCancelled,
    required this.boatCruiseBooking,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      paddingNumber: 15,
      borderRadius: 12,
      child: CustomColumn(
        children: [
          //first section
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //date
              Text(
                AppDateFormater.formatDate(
                    date: boatCruiseBooking.dateToCruise),
                style: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor),
              )
            ],
          ),

          const CustomHeight(height: 5),

          //
          Row(
            spacing: 10,
            children: [
              //image
              CustomDisplayClipImageWithSize(
                imageUrl: boatCruiseBooking.boatCruise.boatImages.first,
                isNetworkImage: true,
              ),

              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    boatCruiseBooking.boatCruise.name,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Text(
                    "${boatCruiseBooking.boatCruise.boatCruiseDetails.last.detailCount.value} passengers",
                    style: customTextStyle(
                        fontSize: 12,
                        color: AppColors.appTextFadedColor,
                        fontWeight: FontWeight.w300),
                  ),

                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDisplayCost(
                        cost: boatCruiseBooking.boatCruise.boatFee.toString(),
                        perWhat: "per night",
                      ),
                      const CustomWidth(width: 15),
                      CustomBookingStatus(
                        statusText: boatCruiseBooking.status.name,
                        textAndBorderColor: statusColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),

          //actions
          if (isActive)
            CustomColumn(
              children: [
                const CustomHeight(height: 10),
                const CustomDivider(),
                const CustomHeight(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        onTap: () {},
                        actionText: "Details",
                        style: Theme.of(context)
                            .outlinedButtonTheme
                            .style
                            ?.copyWith(
                              foregroundColor: const WidgetStatePropertyAll(
                                AppColors.appMainColor,
                              ),
                              side: const WidgetStatePropertyAll(
                                  BorderSide(color: AppColors.appMainColor)),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.appWhiteColor),
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () => AppNagivator.pushRoute(
                          const BoatCruiseBookingsReceiptView(),
                        ),
                        text: "View E-Receipt",
                      ),
                    ),
                  ],
                ),
              ],
            ),

          if (isCompleted)
            CustomColumn(
              children: [
                const CustomHeight(height: 10),
                const CustomDivider(),
                const CustomHeight(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        onTap: () => AppNagivator.pushRoute(
                          const BoatCruiseBookingsReceiptView(),
                        ),
                        actionText: "View E-Receipt",
                        style: Theme.of(context)
                            .outlinedButtonTheme
                            .style
                            ?.copyWith(
                              foregroundColor: const WidgetStatePropertyAll(
                                AppColors.appMainColor,
                              ),
                              side: const WidgetStatePropertyAll(
                                  BorderSide(color: AppColors.appMainColor)),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.appWhiteColor),
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () => _leaveReview(context),
                        text: "Leave a review",
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _leaveReview(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return const CustomReview();
      },
    );
  }
}
