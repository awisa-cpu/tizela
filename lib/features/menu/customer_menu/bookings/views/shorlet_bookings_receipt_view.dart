import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booked_user_details.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_shorlet_booking_summary_fourth_section.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class ShorletBookingsReceiptView extends StatelessWidget {
  const ShorletBookingsReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "E-Receipt",
          style: customTextStyle(fontSize: 16),
        ),
      ),
      body: CustomScrollLayoutWidget(
        child: CustomColumn(
          children: [
            SizedBox(
              width: context.screenWidth(),
              child: Image.asset(
                ImagesText.barCodeImage,
                fit: BoxFit.contain,
              ),
            ),
            const CustomHeight(height: 10),
            const CustomBookingSummaryTab(
              child: CustomColumn(
                children: [
                  CustomContainerBookingSummary(
                    target: "Date",
                    location: "Dec 23 - Dec 27 2022",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 13.5),
                  CustomContainerBookingSummary(
                    target: "Check in",
                    location: "Dec 23 2022",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 13.5),
                  CustomContainerBookingSummary(
                    target: "Check out",
                    location: " Dec 27 2022",
                    shouldExpand: false,
                  ),
                ],
              ),
            ),
            const CustomHeight(height: 10),
            const CustomShorletBookingSummaryFourthSection(),
            const CustomHeight(height: 10),
            const CustomBookedUserDetails(),
          ],
        ),
      ),
    );
  }
}
