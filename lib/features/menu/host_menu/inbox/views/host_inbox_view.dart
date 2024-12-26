import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_empty_data_view.dart';
import 'package:tizela/common/widgets/custom_sliver_and_tab_bar_view.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/inbox/model/message_model.dart';
import 'package:tizela/features/menu/customer_menu/inbox/views/inbox_view.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class HostInboxView extends StatelessWidget {
  const HostInboxView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> todayMessages =
        LocalDatabase.messages.where(_checkFortodayMessages).toList();
    final List<MessageModel> previousDayMessages =
        LocalDatabase.messages.where(_checkForPreviousDayMessages).toList();
    final List<MessageModel> previous2DaysMessages =
        LocalDatabase.messages.where(_checkForPrevious2DaysMessages).toList();

    //
    return Scaffold(
      body: CustomSliverAndTabBarView(
        isScrollable: true,
        shouldCenterTitle: false,
        shouldImplyLeading: false,
        tabAlignment: TabAlignment.start,
        title: "Inbox",
        tabs: const [
          Tab(
            text: "All",
          ),
          Tab(
            text: "Read",
          ),
          Tab(
            text: "Unread",
          ),
        ],
        tabBarView: TabBarView(
          children: [
            CustomScrollableLayoutWidget(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 13.5),
              child: CustomColumn(
                children: [
                  todayMessages.isNotEmpty
                      ? CustomColumn(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.5),
                              child: Text(
                                "Today",
                                style: customTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.appTextFadedColor),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: todayMessages.length,
                              itemBuilder: (_, index) {
                                final message = todayMessages[index];

                                return CustomInboxMessage(
                                  message: message,
                                );
                              },
                            ),
                            const CustomDivider(),
                          ],
                        )
                      : const SizedBox.shrink(),
                  previousDayMessages.isNotEmpty
                      ? CustomColumn(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.5),
                              child: Text(
                                "Yesterday",
                                style: customTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.appTextFadedColor),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: previousDayMessages.length,
                              itemBuilder: (_, index) {
                                final message = previousDayMessages[index];

                                return CustomInboxMessage(
                                  message: message,
                                );
                              },
                            ),
                            const CustomDivider(),
                          ],
                        )
                      : const SizedBox.shrink(),
                  previous2DaysMessages.isNotEmpty
                      ? CustomColumn(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.5),
                              child: Text(
                                "Other days",
                                style: customTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.appTextFadedColor),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: previous2DaysMessages.length,
                              itemBuilder: (_, index) {
                                final message = previous2DaysMessages[index];

                                return CustomInboxMessage(
                                  message: message,
                                );
                              },
                            ),
                            const CustomDivider(),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            const CustomEmptyDataView(
              mainText: "No message in your inbox",
              subText: "You would be notified as soon as\nyou get one",
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  bool _checkFortodayMessages(MessageModel message) {
    final today = DateTime.now();

    if (message.dateSent.year == today.year) {
      if (message.dateSent.month == today.month) {
        if (message.dateSent.day == today.day) {
          return true;
        }
      }
    }

    return false;
  }

  bool _checkForPreviousDayMessages(MessageModel message) {
    final previousDay = DateTime.now().subtract(const Duration(days: 1));

    if (message.dateSent.year == previousDay.year) {
      if (message.dateSent.month == previousDay.month) {
        if (message.dateSent.day == previousDay.day) {
          return true;
        }
      }
    }

    return false;
  }

  bool _checkForPrevious2DaysMessages(MessageModel message) {
    final previousDay = DateTime.now();

//return all the messages of thesame month
    if (message.dateSent.year == previousDay.year) {
      if (message.dateSent.month == previousDay.month) {
        return true;
      }
    }

    return false;
  }
}
