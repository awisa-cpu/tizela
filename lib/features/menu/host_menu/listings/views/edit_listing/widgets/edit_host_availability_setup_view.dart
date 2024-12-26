import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

class EditHostAvailabilitySetupView extends StatelessWidget {
  final ShortletModel shorlet;
  const EditHostAvailabilitySetupView({super.key, required this.shorlet});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: kToolbarHeight, left: 20, right: 20),
              color: Colors.grey.withValues(alpha: 0.5),
              height: context.screenHeight() * 0.40,
              child: const CustomColumn(
                children: [
                  CustomHeaderSubAndBackButton(
                    headerText: "Identity card verification",
                    isthereSubText: false,
                  ),
                  CustomHeight(),
                  CustomHostAvailabilitySetupCard(),
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelPadding: EdgeInsets.all(12),
                    enableFeedback: false,
                    tabs: [
                      Tab(
                        height: 30,
                        text: "Available dates",
                      ),
                      Tab(
                        height: 30,
                        text: "Blocked-out dates",
                      )
                    ],
                  ),
                ],
              ),
            ),
            const CustomHeight(),
            const CustomAvailabilitySetup()
          ],
        ),
      )

/*
            NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.appWhiteColor,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () => AppNagivator.goBack(context),
                  child: const Icon(Icons.arrow_back_rounded),
                ),
                centerTitle: false,
                pinned: true,
                title: Text(
                  "Availability Set-up",
                  style: customTextStyle(fontSize: 20),
                ),
                flexibleSpace: const Padding(
                  padding: EdgeInsets.only(top: 80, left: 13.5, right: 13.5),
                  child: CustomHostAvailabilitySetupCard(),
                ),
                expandedHeight: 280,
                bottom: const TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.all(12),
                  enableFeedback: false,
                  tabs: [
                    Tab(
                      height: 30,
                      text: "Available dates",
                    ),
                    Tab(
                      height: 30,
                      text: "Blocked-out dates",
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              Container(),
              Container(),
            ],
          ),
        ),
        */
          ),
    );
  }
}

class CustomAvailabilitySetup extends StatefulWidget {
  const CustomAvailabilitySetup({
    super.key,
  });

  @override
  State<CustomAvailabilitySetup> createState() =>
      _CustomAvailabilitySetupState();
}

class _CustomAvailabilitySetupState extends State<CustomAvailabilitySetup> {
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
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          //date in
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
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
        ],
      ),
    );
  }
}

class CustomHostAvailabilitySetupCard extends StatelessWidget {
  const CustomHostAvailabilitySetupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      margin: const EdgeInsets.symmetric(vertical: 15),
      showBorder: false,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.2),
          spreadRadius: 5.0,
          blurRadius: 5.0,
          offset: const Offset(2, 2),
        )
      ],
      child:
          //shorlet details
          Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomDisplayClipImageWithSize(
            imageUrl: ImagesText.lounge1,
          ),
          const CustomWidth(width: 10),

          //customer details
          Expanded(
            child: CustomColumn(
              children: [
                //name
                Text(
                  "Sunderam Boys  PG",
                  style: customTextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const CustomHeight(height: 5),
                Text(
                  "Studio Apartment",
                  style: customTextStyle(
                    fontSize: 12,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                const CustomHeight(height: 5),
                Text(
                  "17th June, 2024",
                  style: customTextStyle(
                    fontSize: 10,
                    color: AppColors.appMainColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
