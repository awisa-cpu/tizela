import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_add_listing_button.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_listing_tab_button.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../personalization/host_personalization/profile/views/booking_type_setting_view.dart';
import '../../../../../personalization/host_personalization/profile/views/payment_details_view.dart';

class CustomHostHomeListingIndication extends StatelessWidget {
  const CustomHostHomeListingIndication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        //manage view for payment and booking type setting
        CustomRoundedEdgedContainer(
          borderColor: AppColors.appTextFadedColor.withOpacity(0.4),
          borderRadius: 10.0,
          child: CustomColumn(
            children: [
              Row(
                children: [
                  CustomColumn(
                    children: [
                      Text(
                        "Listing Status",
                        style: customTextStyle(fontSize: 16),
                      ),
                      const CustomHeight(height: 10),
                      Text(
                        "“ASQ house” awaits admin approval",
                        style: customTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: AppColors.appTextFadedColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AppNagivator.pushRoute(
                    context,
                    (_) => const PaymentDetailsView(),
                  );
                },
                child: CustomRoundedEdgedContainer(
                  paddingNumber: 0.0,
                  height: 80,
                  showBorder: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment options",
                        style: customTextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImagesText.infoCircleIcon),
                          const Icon(Icons.chevron_right_outlined),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppNagivator.pushRoute(
                    context,
                    (_) => const BookingTypeSettingView(),
                  );
                },
                child: CustomRoundedEdgedContainer(
                  paddingNumber: 0.0,
                  height: 80,
                  showBorder: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking type setting",
                        style: customTextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImagesText.infoCircleIcon),
                          const Icon(Icons.chevron_right_outlined),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const CustomHeight(height: 25),

        //add listing button
        CustomHostAddListingButton(
          onTap: () {},
        ),
        const CustomHeight(height: 35),
        CustomColumn(
          children: [
            Text(
              "Would you like to list another service?",
              style: customTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const CustomHeight(height: 15),

            //car rental
            CustomListingTabButton(
              borderColor: AppColors.appIconColor.withOpacity(0.3),
              bkGroundColor: AppColors.appIconColorBox,
              imageUrl: ImagesText.carIcon,
              mainText: "Car Rental",
              subText: "List “cars” for rental to  potential clients.",
              imageColor: AppColors.appMainColor,
              onTap: () {},
            ),
            const CustomHeight(height: 15),

            //boat cruise
            CustomListingTabButton(
              borderColor: const Color(0xFF0CF6B4).withOpacity(0.3),
              bkGroundColor: const Color(0xFF0CF6B4).withOpacity(0.02),
              imageUrl: ImagesText.shipIcon,
              mainText: "Boat Cruise",
              subText: "List “boat cruise” services to potential guest.",
              imageColor: Colors.green,
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
