import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/setup/app_navigator.dart';

class UserForgotPasswordView extends StatelessWidget {
  const UserForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: "Forgot password",
              subText1: "Don't worry it happens to the best of us. Enter your",
              subText2: "email and we'll send a code to reset your password.",
              onPressedBackButton: () => AppNagivator.goBack(context),
            ),
            const CustomHeight(height: 35),
            const CustomTextFormField(labelText: "Email"),
            const CustomHeight(height: 35),
            CustomEleButton(
              onPressed: () => AppNagivator.pushNamedRoute(
                context,
                userPasswordVerifyEmailRoute,
              ),
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
