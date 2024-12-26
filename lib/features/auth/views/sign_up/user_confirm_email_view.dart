import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../common/styles/custom_scrollable_layout_widget.dart';

class UserConfirmationEmailView extends StatelessWidget {
  const UserConfirmationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: "Let's confirm your email ",
              subText1: "To ensure a seemless experience kindly click",
              subText2: "on the email we sent to your inbox.",
              onPressedBackButton: () => AppNagivator.goBack(),
            ),
            const CustomHeight(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: "6-digit code"),
            ),
            const CustomHeight(height: 20),
            CustomEleButton(
                onPressed: () => AppNagivator.pushNamedRoute(
                      userSignInRoute,
                    ),
                text: "Continue"),
            const CustomHeight(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "Didn't receive any email?Check your spam folder or"),
                const CustomHeight(height: 10),
                Text(
                  "Resend in 00:49",
                  style: customTextStyle(color: AppColors.appMainColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
