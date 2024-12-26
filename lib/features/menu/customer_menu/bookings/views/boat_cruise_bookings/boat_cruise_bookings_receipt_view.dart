import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booked_user_details.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_summary_tab.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_container_booking_summary.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class BoatCruiseBookingsReceiptView extends StatelessWidget {
  const BoatCruiseBookingsReceiptView({super.key});

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
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          children: [
            SizedBox(
              width: context.screenWidth(),
              child: Image.asset(
                ImagesText.barCodeImage,
                fit: BoxFit.contain,
              ),
            ),
            const CustomHeight(height: 15),
            const CustomBookingSummaryTab(
              child: CustomColumn(
                children: [
                  CustomContainerBookingSummary(
                    target: "Date",
                    location: "Dec 27th, 2024",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 13.5),
                  CustomContainerBookingSummary(
                    target: "Start time",
                    location: "7:00AM",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 13.5),
                  CustomContainerBookingSummary(
                    target: "End time",
                    location: "8:00AM",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 13.5),
                  CustomContainerBookingSummary(
                    target: "Passengers",
                    location: "2",
                    shouldExpand: false,
                  ),
                ],
              ),
            ),
            const CustomHeight(height: 15),
            const CustomBookingSummaryTab(
              child: CustomColumn(
                children: [
                  CustomContainerBookingSummary(
                    target: "Cost",
                    location: "#180,000",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 20),
                  CustomContainerBookingSummary(
                    target: "Service fee",
                    location: "#10,600",
                    shouldExpand: false,
                  ),
                  SizedBox(height: 20),
                  CustomDivider(),
                  SizedBox(height: 20),
                  CustomContainerBookingSummary(
                    target: "Total",
                    location: "#190,600",
                    shouldExpand: false,
                  ),
                ],
              ),
            ),
            const CustomHeight(height: 15),
            const CustomBookedUserDetails(),
          ],
        ),
      ),
    );
  }
}
