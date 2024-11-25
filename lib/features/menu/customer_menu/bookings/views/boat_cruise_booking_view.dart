import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';

import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';

import 'package:tizela/features/menu/customer_menu/bookings/views/boat_cruise_booking_summary.dart';
import 'package:tizela/features/menu/customer_menu/home/model/boat_cruise_model_xxxxx.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../utils/device/app_device_services/app_device_services.dart';

class BoatCruiseBookingView extends StatefulWidget {
  final BoatCruiseModelxxxxxxxx boatCruise;
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
      body: CustomScrollLayoutWidget(
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
                const CustomHeight(height: 10),
                TableCalendar(
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
                const CustomHeight(height: 30),
                Text(
                  "How many passengers?",
                  style: customTextStyle(fontSize: 16),
                ),
                const CustomHeight(height: 10),
                CustomDropdownForm(
                  currentValue: "1",
                  items: const ["1", "2", "3", "4", "5"],
                  onChanged: (newValue) {},
                ),
                const CustomHeight(height: 30),

                //
                const CustomBoatCruiseDurationSelector(),
                const CustomHeight(height: 10),
                CustomEleButton(
                    onPressed: () {
                      AppNagivator.pushRoute(
                        context,
                        (_) => BoatCruiseBookingSummary(
                          boatCruise: widget.boatCruise,
                        ),
                      );
                    },
                    text: "Proceed"),
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

  final BoatCruiseModelxxxxxxxx boatCruise;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withOpacity(0.1),
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
            child: SizedBox(
              height: 100,
              width: 110,
              child: Image.asset(
                boatCruise.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const CustomWidth(width: 10),

          //details
          CustomColumn(
            children: [
              Text(
                boatCruise.name,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const CustomHeight(height: 5),
              //passenger count
              Text(
                "18 passengers",
                style: customTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appTextFadedColor,
                ),
              ),
              const CustomHeight(height: 5),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "#${boatCruise.cost}",
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
