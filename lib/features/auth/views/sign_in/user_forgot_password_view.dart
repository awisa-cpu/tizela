import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/auth/controllers/user_sign_in_controller.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../utils/validators/app_validators.dart';

class UserForgotPasswordView extends StatelessWidget {
  const UserForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserSignInController.instance;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Form(
          key: controller.forgotPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeaderTexts(
                mainText: "Forgot password",
                subText1:
                    "Don't worry it happens to the best of us. Enter your",
                subText2: "email and we'll send a code to reset your password.",
                onPressedBackButton: () => AppNagivator.goBack(),
              ),
              const CustomHeight(height: 35),
              CustomTextFormField(
                controller: controller.forgotPasswordEmailController,
                labelText: "Email",
                validator: (value) => AppValidators.validateEmail(value),
              ),
              const CustomHeight(height: 35),
              Obx(
                () => CustomEleButton(
                  onPressed: () => controller.forgotUserPassword(),

                  // onPressed: () {
                  //   AppNagivator.pushRoute(
                  //     const UserPasswordVerifyEmailView()
                  //   );
                  // },

                  text: controller.isPasswordForgotloading.value
                      ? "sending email, pls wait..."
                      : "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
