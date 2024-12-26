import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import '../../../../utils/device/app_device_services/app_device_services.dart';
import 'widgets/user_sign_in_form.dart';

class UserSignInView extends StatefulWidget {
  const UserSignInView({super.key});

  @override
  State<UserSignInView> createState() => _UserSignInViewState();
}

class _UserSignInViewState extends State<UserSignInView> {
  @override
  void initState() {
    super.initState();
    AppDeviceServices.restoreStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeaderTexts(
              mainText: "Login",
              subText1: "Kindly enter your details to access your account",
              subText2: "",
              showBackButton: false,
            ),
            const SizedBox(height: 30),
            UserSignInForm(),
          ],
        ),
      ),
    );
  }
}
