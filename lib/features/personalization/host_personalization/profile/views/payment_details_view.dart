import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import 'widgets/custom_info_notification_with_text.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  final List<String> banks = [
    "Access",
    "Diamond",
    "Zenith",
    "UBA",
    "Opay",
    "Firstbank",
    "Fcmb"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            const CustomHeaderSubAndBackButton(
              headerText: "Payment details",
              isthereSubText: false,
            ),
            const CustomHeight(height: 30),

            //
            Form(
              child: CustomColumn(
                children: [
                  Text(
                    "Bank name",
                    style: customTextStyle(fontSize: 16),
                  ),
                  const CustomHeight(height: 15),
                  DropdownButtonFormField(
                    menuMaxHeight: 200,
                    alignment: Alignment.bottomCenter,
                    dropdownColor: AppColors.appWhiteColor,
                    elevation: 3,
                    enableFeedback: false,
                    value: banks[0],
                    items: banks
                        .map(
                          (bank) => DropdownMenuItem(
                            value: bank,
                            child: Text(bank),
                          ),
                        )
                        .toList(),
                    onChanged: (newBank) {},
                  ),
                  const CustomHeight(height: 30),
                  Text(
                    "Account number",
                    style: customTextStyle(fontSize: 16),
                  ),
                  const CustomHeight(height: 15),
                  const CustomTextFormField(labelText: "2212333501"),
                  const CustomHeight(height: 7),
                  const CustomInfoNotificationWithText(
                    text: "Please verify your account no.",
                  ),
                  const CustomHeight(height: 30),
                  Text(
                    "Account name",
                    style: customTextStyle(fontSize: 16),
                  ),
                  const CustomHeight(height: 15),
                  const CustomTextFormField(labelText: "Asoquo Godwin"),
                  const CustomHeight(height: 7),
                  const CustomInfoNotificationWithText(
                    text: "Please enter the full name on your account",
                  ),
                  SizedBox(
                    height: context.screenHeight() * 0.10,
                  ),
                  CustomEleButton(onPressed: () {}, text: "save")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
