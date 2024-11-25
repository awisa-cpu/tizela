import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/home/model/shorlet_model_xxxxx.dart';
import '../../../../../utils/device/app_device_services/app_device_services.dart';
import 'widgets/custom_shorlet_booking_summary_fifth_section.dart';
import 'widgets/custom_shorlet_booking_summary_first_section.dart';
import 'widgets/custom_shorlet_booking_summary_fourth_section.dart';
import 'widgets/custom_shorlet_booking_summary_second_section.dart';
import 'widgets/custom_shorlet_booking_summary_third_section.dart';
import 'widgets/custom_shortlet_bookings_summary_form.dart';

class ShorletBookingsSummaryView extends StatefulWidget {
  final ShortletModelxxxxxxxxxxxxxxxx shortlet;

  const ShorletBookingsSummaryView({super.key, required this.shortlet});

  @override
  State<ShorletBookingsSummaryView> createState() =>
      _ShorletBookingsSummaryViewState();
}

class _ShorletBookingsSummaryViewState
    extends State<ShorletBookingsSummaryView> {
  @override
  void initState() {
    super.initState();
    AppDeviceServices.restoreStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Booking summary",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: CustomScrollLayoutWidget(
        child: CustomColumn(
          children: [
            CustomShorletBookingSummaryFirstSection(shortlet: widget.shortlet),
            const CustomHeight(height: 30),
            const CustomShorletBookingSummarySecondSection(),
            const CustomHeight(height: 30),
            const CustomShorletBookingSummaryThirdSection(),
            const CustomHeight(height: 30),
            const CustomShorletBookingSummaryFourthSection(),
            const CustomHeight(height: 30),
            const CustomShorletBookingSummaryFifthSection(),
            const CustomHeight(height: 15),
            const CustomShortletBookingsSummaryForm()
          ],
        ),
      ),
    );
  }
}
