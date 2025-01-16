import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/boat_cruise_booking_model.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';

import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../widgets/custom_outlined_booking_status_button.dart';

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
                    date: boatCruiseBooking.bookingDateCreated),
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
                imageUrl: boatCruiseBooking.boatCruiseDetails['boatImage'] as String,
                isNetworkImage: true,
              ),

              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    boatCruiseBooking.boatCruiseDetails['boatName'] as String,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Text(
                    "${boatCruiseBooking.boatCruiseDetails['boatCruiseMaxPassenger'] as int} passengers",
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
                        cost: boatCruiseBooking.boatCruiseDetails['boatPrice'].toString(),
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
                  spacing: 25,
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        buttonText: 'Details',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () {
                          //    AppNagivator.pushRoute(
                          //   const BoatCruiseBookingsReceiptView(),
                          // )
                        },
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
                  spacing: 25,
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        buttonText: 'View E-Receipt',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () => AppFunctions.displayReviewSheet(
                          context: context,
                          child: const CustomReview(),
                        ),
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
}
