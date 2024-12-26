import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import 'widgets/custom_host_booking_type_button.dart';

class BookingTypeSettingView extends StatefulWidget {
  const BookingTypeSettingView({super.key});

  @override
  State<BookingTypeSettingView> createState() => _BookingTypeSettingViewState();
}

class _BookingTypeSettingViewState extends State<BookingTypeSettingView> {
  bool isInstantHostTapped = false;
  bool isApproveDeclineTapped = false;

  Color? instantBorderColor = Colors.grey.withValues(alpha: 0.5);
  Color? approveDeclineBorderColor = Colors.grey.withValues(alpha: 0.5);

  double instantBorderWidth = 1.0;
  double approveDeclineBorderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //
            CustomColumn(
              children: [
                const CustomHeaderSubAndBackButton(
                  headerText: "Decide how you want to\n confirm  bookings",
                  isthereSubText: false,
                ),
                //
                const CustomHeight(height: 30),
                CustomScrollableLayoutWidget(
                  child: CustomColumn(
                    children: [
                      CustomHostBookingTypeButton(
                        mainText: "Instant Booking",
                        subText: "Guest can book automatically",
                        imageUrl: ImagesText.userIcon,
                        borderWidth: instantBorderWidth,
                        isTapped: isInstantHostTapped,
                        borderColor: instantBorderColor,
                        onTap: _tapInstantBooking,
                      ),
                      const CustomHeight(height: 25),
                      CustomHostBookingTypeButton(
                        mainText: "Approve or decline request",
                        subText: "Guest may ask if they can book",
                        imageUrl: ImagesText.userIcon,
                        borderWidth: approveDeclineBorderWidth,
                        isTapped: isApproveDeclineTapped,
                        borderColor: approveDeclineBorderColor,
                        onTap: _tapApproveDeclineRequest,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapInstantBooking() {
    setState(() {
      isInstantHostTapped = true;
      isApproveDeclineTapped = false;

      //
      if (isInstantHostTapped) {
        instantBorderColor = AppColors.appMainColor;
        instantBorderWidth = 2.0;

        approveDeclineBorderColor = Colors.grey.withValues(alpha: 0.5);
        approveDeclineBorderWidth = 1.0;
      }
    });
  }

  void _tapApproveDeclineRequest() {
    setState(() {
      isInstantHostTapped = false;
      isApproveDeclineTapped = true;

      //
      if (isApproveDeclineTapped) {
        instantBorderColor = Colors.grey.withValues(alpha: 0.5);
        instantBorderWidth = 1.0;

        approveDeclineBorderColor = AppColors.appMainColor;
        approveDeclineBorderWidth = 2.0;
      }
    });
  }
}
