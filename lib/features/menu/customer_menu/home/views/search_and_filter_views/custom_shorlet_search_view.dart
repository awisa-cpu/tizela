import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../common/widgets/custom_sliver_and_tab_bar_view.dart';
import '../widgets/custom_date_check_in_and_out.dart';
import '../widgets/custom_guest_options.dart';
import '../widgets/custom_search_location.dart';
import '../widgets/custom_tab.dart';

class CustomSearchStayView extends StatefulWidget {
  const CustomSearchStayView({super.key});

  @override
  State<CustomSearchStayView> createState() => _CustomSearchStayViewState();
}

class _CustomSearchStayViewState extends State<CustomSearchStayView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? selectedDayVar;
  CalendarFormat calenderFormat = CalendarFormat.month;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void _onDateSelected(DateTime date, DateTime selectedDay) {
    setState(() {
      _focusedDay = date;
      selectedDayVar = selectedDay;
    });
  }

  void onFormatChanged(CalendarFormat format) => setState(() {
        calenderFormat = format;
      });

  void onPageChanged(DateTime focusedDay) => setState(() {
        _focusedDay = focusedDay;
      });

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      selectedDayVar = null;
      rangeStart = start;
      rangeEnd = end;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSliverAndTabBarView(
      tabs: const [
        CustomTab(text: "Location", imageIcon: ImagesText.locationIcon),
        CustomTab(text: "Date", imageIcon: ImagesText.calendarIcon),
        CustomTab(text: "Guest", imageIcon: ImagesText.guestIcon),
      ],
      tabBarView: TabBarView(
        children: [
          CustomSearchLocation(
            locationText: "Enter location",
            controllerText: "Enter Pick location",
            eleButtonText: "Continue",
            onEleButtonPressed: () => AppNagivator.pushNamedRoute(
              shortletResultRoute,
            ),
          ),
          CustomScrollableLayoutWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select dates",
                      style: customTextStyle(fontSize: 16),
                    ),
                    const CustomWidth(width: 4),
                    Text(
                      "(Check-in & check-out)",
                      style: customTextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.appTextFadedColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                //calendar
                //check in calender
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                      onFormatChanged: onFormatChanged,
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2023, 1, 30),
                      lastDay: DateTime.utc(2030, 12, 30),
                      rangeStartDay: rangeStart,
                      rangeEndDay: rangeEnd,
                      onDaySelected: _onDateSelected,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, _focusedDay),
                      onPageChanged: onPageChanged,
                      onRangeSelected: onRangeSelected,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                    ),

                    // check out calendar
                    TableCalendar(
                      headerStyle: const HeaderStyle(
                          leftChevronVisible: false,
                          formatButtonVisible: false,
                          rightChevronIcon:
                              Icon(Icons.keyboard_arrow_down_sharp)),
                      rowHeight: 38,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2023, 1, 30),
                      lastDay: DateTime.utc(2030, 12, 30),
                    ),
                  ],
                ),
                const CustomHeight(height: 30),

                //selected dates
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDateCheckInAndOut(
                      checkIn: "Check in",
                      checkOut: "Mar 23",
                      imageIcon: ImagesText.calenderGreyIcon,
                      onTap: () {},
                    ),
                    Image.asset(ImagesText.horizontalLineIcon),
                    CustomDateCheckInAndOut(
                      checkIn: "Check out",
                      checkOut: "Apr 4",
                      imageIcon: ImagesText.calenderGreyIcon,
                      onTap: () {},
                    ),
                  ],
                ),
                const CustomHeight(height: 10),
                CustomEleButton(
                  onPressed: () => AppNagivator.pushNamedRoute(
                    shortletResultRoute,
                  ),
                  text: "Continue",
                ),
              ],
            ),
          ),
          CustomScrollableLayoutWidget(
            child: Column(
              children: [
                CustomGuestOptions(
                  mainText: "Adult",
                  onAdd: () {},
                  onRemove: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGuestOptions(
                  mainText: "Children",
                  subText: "Ages 3-17",
                  onAdd: () {},
                  onRemove: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGuestOptions(
                  mainText: "Infants",
                  subText: "Under 12",
                  onAdd: () {},
                  onRemove: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGuestOptions(
                  mainText: "pets",
                  onAdd: () {},
                  onRemove: () {},
                ),
                SizedBox(
                  height: context.screenHeight() * 0.50,
                ),
                CustomEleButton(
                  onPressed: () => AppNagivator.pushNamedRoute(
                    shortletResultRoute,
                  ),
                  text: "Continue",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
