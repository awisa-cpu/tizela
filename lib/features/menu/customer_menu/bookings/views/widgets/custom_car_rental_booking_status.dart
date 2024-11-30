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
import 'package:tizela/features/menu/customer_menu/bookings/views/car_rental_bookings_receipt_view.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomCarRentalBookingStatus extends StatelessWidget {
  final CarRentalModelxxxxxxxxxxx carRental;
  final String statusText;
  final Color statusColor;
  final bool isActive, isComplete, isCancelled;
  const CustomCarRentalBookingStatus({
    super.key,
    required this.carRental,
    required this.statusText,
    required this.statusColor,
    required this.isActive,
    required this.isComplete,
    required this.isCancelled,
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
                AppDateFormater.formatDate(date:DateTime.now()),
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
                imageUrl: carRental.imageUrl,
              ),
              const CustomWidth(width: 10),
              CustomColumn(
                children: [
                  //name
                  Text(
                    carRental.name,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const CustomHeight(height: 5),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconAndText(
                        imageIcon: ImagesText.userIcon,
                        text: "4",
                        color: AppColors.appIconColorBox,
                        textStyle: customTextStyle(
                          fontSize: 14,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const CustomWidth(width: 5),
                      CustomIconAndText(
                        imageIcon: ImagesText.holidayBagIcon,
                        text: "2",
                        color: AppColors.appIconColorBox,
                        textStyle: customTextStyle(
                          fontSize: 14,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const CustomWidth(width: 5),
                      CustomIconAndText(
                        imageIcon: ImagesText.acIcon,
                        text: "AC",
                        color: AppColors.appIconColorBox,
                        textStyle: customTextStyle(
                          fontSize: 14,
                          color: AppColors.appTextFadedColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const CustomHeight(height: 5),

                  const CustomHeight(height: 5),
                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDisplayCost(
                        cost: carRental.cost,
                        perWhat: "12hr",
                      ),
                      const CustomWidth(width: 15),
                      CustomBookingStatus(
                        statusText: statusText,
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
                          context,
                          (_) => const CarRentalBookingsReceiptView(),
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
                          context,
                          (_) => const CarRentalBookingsReceiptView(),
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
