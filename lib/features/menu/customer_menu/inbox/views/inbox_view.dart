import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_sliver_and_tab_bar_view.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/inbox/model/message_model.dart';
import 'package:tizela/features/menu/customer_menu/inbox/views/detail_message_inbox_view.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/datetime_extension.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

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
            CustomScrollLayoutWidget(
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
            Container(),
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

class CustomInboxMessage extends StatelessWidget {
  final MessageModel message;

  const CustomInboxMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: Column(
        children: [
          ListTile(
            dense: false,
            leading: Image.asset(ImagesText.notificationIcon),
            title: Text(
              message.title,
              style:
                  customTextStyle(fontSize: 14, color: AppColors.appMainColor),
            ),
            subtitle: Text(
              message.subInformation ?? '',
              style: customTextStyle(
                  fontSize: 12,
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const CustomHeight(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 50.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                message.body != null
                    ? GestureDetector(
                        onTap: () {
                          AppNagivator.pushRoute(
                            context,
                            (_) => DetailMessageInboxView(message: message),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "View Details",
                              style: customTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF37A5FF),
                                  color: const Color(0xFF37A5FF)),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFF37A5FF),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                Text(
                  "At ${message.dateSent.getHMTime()}",
                  style: customTextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
