import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'widgets/user_sign_in_check_form.dart';
import 'widgets/auth_header_texts.dart';
import 'widgets/terms_and_conditions.dart';

//if the user (customer or host ) inputs their email and they don't have an account, they are navigated to the sign up
//view
class UserSignInCheckView extends StatelessWidget {
  const UserSignInCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: 'Sign in or create an account',
              subText1: 'We need it to look up your account or create',
              subText2: 'a new one',
              onPressedBackButton: () => AppNagivator.goBack(context),
            ),
            const CustomHeight(height: 20),
            const UserSignInCheckForm(),
            const CustomHeight(height: 10),
            const TermsAndConditions(),
          ],
        ),
      ),
    );
  }
}
