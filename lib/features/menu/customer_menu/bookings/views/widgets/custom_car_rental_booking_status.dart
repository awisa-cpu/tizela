import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/car_rental_booking_model.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings/car_rental_bookings_receipt_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';

import '../../../../../../utils/device/app_functions.dart/app_functions.dart';

class CustomCarRentalBookingStatus extends StatelessWidget {
  final CarRentalBookingModel bookingCarRental;
  final Color statusColor;
  final bool isActive, isComplete, isCancelled;
  const CustomCarRentalBookingStatus({
    super.key,
    required this.statusColor,
    required this.isActive,
    required this.isComplete,
    required this.isCancelled,
    required this.bookingCarRental,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      paddingNumber: 15,
      borderRadius: 12,
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //date
              Text(
                AppDateFormater.formatDate(date: bookingCarRental.dateCreated),
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
            children: [
              //image
              CustomDisplayClipImageWithSize(
                imageUrl: bookingCarRental.carRental.carImages.first,
                isNetworkImage: true,
              ),
              const CustomWidth(width: 10),
              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    bookingCarRental.carRental.carName,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    spacing: 7,
                    children: bookingCarRental.carRental.carRentalDetails.map(
                      (attribute) {
                        return CustomIconAndText(
                          text: attribute.detailCount.value.toString(),
                          iconImage: AppFunctions.getIconImageByAttributeName(
                              attribute.name),
                          color: AppColors.appIconColorBox,
                          textStyle: customTextStyle(
                            fontSize: 14,
                            color: AppColors.appTextFadedColor,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ).toList(),
                  ),

                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDisplayCost(
                        cost: bookingCarRental.carRental.carPrice.toString(),
                        perWhat: "12hr",
                      ),
                      const CustomWidth(width: 15),
                      CustomBookingStatus(
                        statusText: bookingCarRental.status.name,
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
                          const CarRentalBookingsReceiptView(),
                        ),
                        text: "View E-Receipt",
                      ),
                    ),
                  ],
                ),
              ],
            ),

          if (isComplete)
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
                          const CarRentalBookingsReceiptView(),
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
