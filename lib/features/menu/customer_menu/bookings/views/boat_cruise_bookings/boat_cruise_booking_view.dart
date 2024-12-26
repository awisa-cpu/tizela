import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';

import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';

import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_bookings/boat_cruise_booking_summary.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../host_menu/listings/model/boat_cruise_model.dart';

class BoatCruiseBookingView extends StatefulWidget {
  final BoatCruiseModel boatCruise;
  const BoatCruiseBookingView({super.key, required this.boatCruise});

  @override
  State<BoatCruiseBookingView> createState() => _BoatCruiseBookingViewState();
}

class _BoatCruiseBookingViewState extends State<BoatCruiseBookingView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? selectedDayVar;
  CalendarFormat calenderFormat = CalendarFormat.month;

  void _onDateSelected(DateTime date, DateTime selectedDay) {
    setState(() {
      _focusedDay = date;
      selectedDayVar = selectedDay;
    });
  }

  void _onFormatChanged(CalendarFormat format) => setState(() {
        calenderFormat = format;
      });

  void _onPageChanged(DateTime focusedDay) => setState(() {
        _focusedDay = focusedDay;
      });

  @override
  void initState() {
    super.initState();
    AppDeviceServices.restoreStatusBar();
  }

  @override
  void dispose() {
    AppDeviceServices.hideStatusBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Booking",
          style: customTextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          children: [
            CustomBoatCruseBookingFirstSection(
              boatCruise: widget.boatCruise,
            ),
            const CustomHeight(height: 30),
            CustomColumn(
              children: [
                Text(
                  "Select date you would like \nto go on the cruise",
                  style: customTextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: TableCalendar(
                    headerStyle: const HeaderStyle(
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      formatButtonVisible: false,
                    ),
                    rowHeight: 38,
                    locale: 'en_US',
                    availableGestures: AvailableGestures.all,
                    calendarFormat: calenderFormat,
                    onFormatChanged: _onFormatChanged,
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2023, 1, 30),
                    lastDay: DateTime.utc(2030, 12, 30),
                    onDaySelected: _onDateSelected,
                    selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
                    onPageChanged: _onPageChanged,
                  ),
                ),

                //
                Text(
                  "How many passengers?",
                  style: customTextStyle(fontSize: 16),
                ),

                //
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: CustomDropdownForm(
                    currentValue: "1",
                    items: const ["1", "2", "3", "4", "5"],
                    onChanged: (newValue) {},
                  ),
                ),

                //
                const CustomBoatCruiseDurationSelector(),
                const CustomHeight(height: 10),
                CustomEleButton(
                  onPressed: () {
                    AppNagivator.pushRoute(
                      BoatCruiseBookingSummary(
                        boatCruise: widget.boatCruise,
                      ),
                    );
                  },
                  text: "Proceed",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomBoatCruseBookingFirstSection extends StatelessWidget {
  const CustomBoatCruseBookingFirstSection({
    super.key,
    required this.boatCruise,
  });

  final BoatCruiseModel boatCruise;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ],
      paddingNumber: 15,
      borderRadius: 12,
      child: Row(
        children: [
          //image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(
              imageUrl: boatCruise.boatImages.first,
              imageWidth: 110,
              imageHeigth: 100,
              fit: BoxFit.cover,
            ),
          ),
          const CustomWidth(width: 10),

          //details
          CustomColumn(
            children: [
              //
              Text(
                boatCruise.name,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              //todo: passenger count
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "18 passengers",
                  style: customTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor,
                  ),
                ),
              ),

              //cost
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${boatCruise.boatFee.round()}",
                      style: customTextStyle(
                        color: AppColors.appMainColor,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: " / hr",
                      style: customTextStyle(
                          color: AppColors.appMainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomBoatCruiseDurationSelector extends StatelessWidget {
  const CustomBoatCruiseDurationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(children: [
      Text(
        "Select cruise duration",
        style: customTextStyle(fontSize: 16),
      ),
      const CustomHeight(height: 10),
      Row(
        children: [
          Expanded(
            child: CustomColumn(
              children: [
                Text(
                  "Start time",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "07:00 AM"),
                ),
              ],
            ),
          ),
          const CustomWidth(width: 20),
          Expanded(
            child: CustomColumn(
              children: [
                Text(
                  "End  time",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "08:00 AM"),
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
