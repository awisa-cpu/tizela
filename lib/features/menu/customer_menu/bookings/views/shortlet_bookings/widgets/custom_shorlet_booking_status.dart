import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_outlined_booking_status_button.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../model/shortlet_booking_model.dart';

class CustomShorletBookingStatus extends StatelessWidget {
  final ShortletBookingModel bookingModel;
  final Color statusColor;
  final bool isActive, isCompleted, isCancelled;
  const CustomShorletBookingStatus({
    super.key,
    required this.bookingModel,
    required this.statusColor,
    required this.isActive,
    required this.isCompleted,
    required this.isCancelled,
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
                AppDateFormater.formatDate(date: bookingModel.bookingDateCreated),
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
                imageUrl: bookingModel.shortletDetails['shortletImage'] as String,
                isNetworkImage: true,
              ),
              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    bookingModel.shortletDetails['shortletName'] as String,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Text(
                    AppFunctions.getDateRange(
                        availableDates: <DateTime>[bookingModel.shortletDetails['startDate'], bookingModel.shortletDetails['endDate']]),
                    style: customTextStyle(
                        fontSize: 12,
                        color: AppColors.appTextFadedColor,
                        fontWeight: FontWeight.w300),
                  ),

                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      CustomDisplayCost(
                        cost: bookingModel.shortletDetails['shortletPrice'].toString(),
                        perWhat: "per night",
                      ),
                      CustomBookingStatus(
                        statusText: bookingModel.status.name,
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
                        onTap: () {},
                        buttonText: "Details",
                      ),
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () {
                          // AppNagivator.pushRoute(
                          // const ShorletBookingsReceiptView(),
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
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        onTap: () {},
                        buttonText: "View E-Receipt",
                      ),
                    ),
                    const SizedBox(
                      width: 25,
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
