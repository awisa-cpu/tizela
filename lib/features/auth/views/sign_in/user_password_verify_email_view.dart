import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/setup/app_navigator.dart';

class UserPasswordVerifyEmailView extends StatelessWidget {
  const UserPasswordVerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: "Verify email",
              subText1: "To ensure a seemless experience kindly enter the",
              subText2: "secured code we sent to your inbox.",
              onPressedBackButton: () => AppNagivator.goBack(),
            ),
            const CustomHeight(height: 35),
            const CustomTextFormField(labelText: "Email"),
            const CustomHeight(height: 35),
            CustomEleButton(
              onPressed: () => AppNagivator.pushNamedRoute(
                userCreatetNewPasswordRoute,
              ),
              text: "Continue",
            ),
            const CustomHeight(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "Didn't receive any email?Checkk your spam folder or"),
                const CustomHeight(height: 10),
                Text(
                  "Resend",
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
