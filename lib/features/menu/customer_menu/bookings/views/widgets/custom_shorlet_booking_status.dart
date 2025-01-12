import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_with_size.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/shortlet_bookings/shorlet_bookings_receipt_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';

import '../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../model/shortlet_booking_model.dart';

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
                AppDateFormater.formatDate(date: bookingModel.bookingDate),
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
                imageUrl: bookingModel.shortlet.apartmentImages.first,
                isNetworkImage: true,
              ),
              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    bookingModel.shortlet.apartmentName,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Text(
                    AppFunctions.getDateRange(availableDates: bookingModel.shortlet.availableDates),
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
                        cost: bookingModel.shortlet.apartmentPrice.toString(),
                        perWhat: "per night",
                      ),
                      const CustomWidth(width: 15),
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
                   
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () => AppNagivator.pushRoute(
                       const ShorletBookingsReceiptView(),
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
                         const ShorletBookingsReceiptView(),
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
