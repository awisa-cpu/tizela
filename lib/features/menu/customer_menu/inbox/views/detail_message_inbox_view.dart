import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/features/menu/customer_menu/inbox/model/message_model.dart';
import 'package:tizela/utils/extensions/datetime_extension.dart';

class DetailMessageInboxView extends StatelessWidget {
  final MessageModel message;
  const DetailMessageInboxView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          message.title,
          style: customTextStyle(fontSize: 16),
        ),
      ),
      body: CustomScrollableLayoutWidget(
        child: CustomColumn(
          children: [
            Text(
              message.dateSent.getFullDate(),
              style: customTextStyle(),
            ),
            const CustomHeight(height: 20),
            Text(
              message.subInformation ?? '',
              style: customTextStyle(fontSize: 14),
            ),
            const CustomHeight(height: 30),
            Text(message.body ?? ''),
          ],
        ),
      ),
    );
  }
}
