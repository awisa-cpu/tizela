import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../../common/widgets/custom_sliver_and_tab_bar_view.dart';
import '../widgets/custom_search_location.dart';
import '../widgets/custom_tab.dart';

class CustomSearchCarRentalView extends StatefulWidget {
  const CustomSearchCarRentalView({super.key});

  @override
  State<CustomSearchCarRentalView> createState() =>
      _CustomSearchCarRentalViewState();
}

class _CustomSearchCarRentalViewState extends State<CustomSearchCarRentalView> {
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CustomSliverAndTabBarView(
      tabs: const [
        CustomTab(
          text: "Pick-up",
          imageIcon: ImagesText.locationIcon,
        ),
        CustomTab(text: "Drop-off", imageIcon: ImagesText.locationIcon),
        CustomTab(text: "Date", imageIcon: ImagesText.calendarIcon),
      ],
      tabBarView: TabBarView(
        children: [
          CustomSearchLocation(
            locationText: "Pick-up location",
            controllerText: "Enter Pick location",
            eleButtonText: "Continue",
            onEleButtonPressed: () =>
                AppNagivator.pushNamedRoute(context, carRentalResultRoute),
          ),
          CustomSearchLocation(
            locationText: "Drop-off location",
            controllerText: "Enter Pick location",
            eleButtonText: "Continue",
            onEleButtonPressed: () =>
                AppNagivator.pushNamedRoute(context, carRentalResultRoute),
          ),
          CustomScrollLayoutWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select date",
                  style: customTextStyle(fontSize: 16),
                ),

                //calender
                TableCalendar(
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronIcon: Icon(Icons.keyboard_arrow_down_sharp)),
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2023, 1, 30),
                  lastDay: DateTime.utc(2030, 12, 30),
                  selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
                  onDaySelected: _onDaySelected,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = selectedDay;
    });
  }
}
