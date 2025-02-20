import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../controller/booking_type_controller.dart';
import 'widgets/custom_host_booking_type_button.dart';

class BookingTypeSettingView extends StatelessWidget {
  const BookingTypeSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingTypeController = Get.put(BookingTypeController());

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          spacing: 30,
          isMainAxisSize: false,
          children: [
            const CustomHeaderSubAndBackButton(
              headerText: "Decide how you want to\n confirm  bookings",
              isthereSubText: false,
            ),
            //
            CustomScrollableLayoutWidget(
              child: CustomColumn(
                spacing: 25,
                children: [
                  //instant booking
                  Obx(
                    () => CustomHostBookingTypeButton(
                      mainText: "Instant Booking",
                      subText: "Guest can book automatically",
                      imageUrl: ImagesText.instantBookingIcon,
                      borderWidth:
                          bookingTypeController.instantBorderWidth.value,
                      isTapped: bookingTypeController.isInstantHostTapped.value,
                      borderColor: bookingTypeController.instantBorderColor,
                      onTap: bookingTypeController.onInstantBookingTapped,
                    ),
                  ),

                  //approve or decline request booking
                  Obx(
                    () => CustomHostBookingTypeButton(
                      mainText: "Approve or decline request",
                      subText: "Guest may ask if they can book",
                      imageUrl: ImagesText.approveBookingIcon,
                      borderWidth:
                          bookingTypeController.approveDeclineBorderWidth.value,
                      isTapped:
                          bookingTypeController.isApproveDeclineTapped.value,
                      borderColor:
                          bookingTypeController.approveDeclineBorderColor,
                      onTap:
                          bookingTypeController.onApproveDeclineRequestTapped,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
