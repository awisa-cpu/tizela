import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/auth/controllers/user_sign_in_controller.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/setup/app_navigator.dart';

import '../../../../../utils/validators/app_validators.dart';

class UserSignInForm extends StatelessWidget {
  UserSignInForm({
    super.key,
  });

  //
  bool userIsHost = true;

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(UserSignInController());
    return Form(
      key: authController.signInFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: authController.emailController,
            labelText: "Email",
            validator: (value) => AppValidators.validateEmail(value),
          ),
          const CustomHeight(height: 20),
          Obx(
            () => CustomTextFormField(
              obscureText: authController.showPassword.value,
              controller: authController.passWordController,
              labelText: "Password",
              maxLines: 1,
              suffixIcon: IconButton(
                highlightColor: Colors.transparent,
                enableFeedback: false,
                icon: Icon(
                  authController.showPassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: authController.onPasswordVisibilityChanged,
              ),
              validator: (value) => AppValidators.validatePassword(value),
            ),
          ),
          const CustomHeight(height: 20),

          //forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => AppNagivator.pushNamedRoute(
                  context,
                  userForgotPasswordRoute,
                ),
                child: const Text("Forgot password?"),
              )
            ],
          ),
          const CustomHeight(height: 30),

          //user login
          CustomEleButton(
            onPressed: authController.loginInUser,
            text: "Continue",
          ),
          const CustomHeight(height: 30),

          //have an account? sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: customTextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              GestureDetector(
                onTap: () => AppNagivator.pushNamedRoute(
                  context,
                  userSignUpRoute,
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.appMainColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
