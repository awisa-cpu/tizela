import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../widgets/custom_edit_view.dart';

class EditShorletAvailability extends StatefulWidget {
  const EditShorletAvailability({super.key});

  @override
  State<EditShorletAvailability> createState() =>
      _EditShorletAvailabilityState();
}

class _EditShorletAvailabilityState extends State<EditShorletAvailability> {
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
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          //date in
          Padding(
            padding: const EdgeInsets.only(bottom: 13.5),
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

          //date out
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 13.5,
            ),
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

          CustomEleButton(onPressed: () {}, text: "Save")
        ],
      ),
    );
  }
}
