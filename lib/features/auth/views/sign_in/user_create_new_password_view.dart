import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/setup/app_navigator.dart';

class UserCreateNewPasswordView extends StatelessWidget {
  const UserCreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: "Create a new password",
              subText1: "To ensure a seemless experience kindly enter the",
              subText2: "secured code we sent to your inbox.",
              onPressedBackButton: () => AppNagivator.goBack(),
            ),
            const CustomHeight(height: 35),
            const CustomTextFormField(labelText: "Password"),
            const CustomHeight(height: 35),
            const CustomTextFormField(labelText: "Confirm password"),
            const CustomHeight(height: 40),
            CustomEleButton(
              onPressed: () => AppNagivator.pushNamedRoute(
                userSignInRoute,
              ),
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
