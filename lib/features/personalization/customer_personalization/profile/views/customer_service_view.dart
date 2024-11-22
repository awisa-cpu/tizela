import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollLayoutWidget(
        padding: EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            CustomHeaderSubAndBackButton(
              headerText: "Customer service",
              isthereSubText: false,
            ),
          ],
        ),
      ),
    );
  }
}
