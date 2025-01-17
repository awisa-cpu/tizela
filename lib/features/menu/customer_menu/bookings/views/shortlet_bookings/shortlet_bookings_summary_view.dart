import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/shortlet_model.dart';
import 'widgets/custom_shorlet_booking_summary_first_section.dart';
import 'widgets/custom_shorlet_booking_summary_fourth_section.dart';
import 'widgets/custom_shorlet_booking_summary_second_section.dart';
import 'widgets/custom_shorlet_booking_summary_third_section.dart';
import 'widgets/custom_shortlet_bookings_summary_form.dart';

class ShorletBookingsSummaryView extends StatefulWidget {
  final ShortletModel shortlet;

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
    //
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
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          spacing: 30,
          children: [
            CustomShorletBookingSummaryFirstSection(shortlet: widget.shortlet),
            CustomShorletBookingSummarySecondSection(
              shortlet: widget.shortlet,
            ),
            CustomShorletBookingSummaryThirdSection(
              guestNunber: widget.shortlet.apartmentDetails
                  .where((value) =>
                      value.name.toLowerCase() == "Guests".toLowerCase())
                  .toList()
                  .first
                  .detailCount
                  .value
                  .toString(),
            ),
            CustomShorletBookingSummaryFourthSection(
              shortletModel: widget.shortlet,
            ),
            CustomShortletBookingsSummaryForm(shortlet: widget.shortlet)
          ],
        ),
      ),
    );
  }
}
