import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../setup/app_navigator.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  //
  @override
  Widget build(BuildContext context) {
    final changePasswordCon = Get.put(ChangePasswordController());

    //
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            CustomHeaderSubAndBackButton(
              headerText: "Change password",
              subText:
                  "Update password with required information\nfor security measures.",
              onTap: () {
                AppNagivator.goBack(context);
                changePasswordCon.resetFormFields();
              },
            ),
            const CustomHeight(height: 30),
            Form(
              key: changePasswordCon.changePasswordFormKey,
              child: CustomColumn(
                children: [
                  Obx(
                    () => CustomTextFormField(
                      maxLines: 1,
                      controller: changePasswordCon.cPasswordCon,
                      labelText: "Current password",
                      obscureText: changePasswordCon
                          .currentPasswordshouldObscureText.value,
                      suffixIcon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed:
                            changePasswordCon.shouldObscureCurrentPassword,
                        icon: Icon(
                          changePasswordCon
                                  .currentPasswordshouldObscureText.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.appTextFadedColor,
                        ),
                      ),
                      validator: (value) =>
                          AppValidators.validatePassword(value),
                    ),
                  ),
                  const CustomHeight(height: 15),
                  Obx(
                    () => CustomTextFormField(
                      maxLines: 1,
                      controller: changePasswordCon.nPasswordCon,
                      labelText: "New password",
                      obscureText:
                          changePasswordCon.newPasswordshouldObscureText.value,
                      suffixIcon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed: changePasswordCon.shouldObscureNewPassword,
                        icon: Icon(
                          changePasswordCon.newPasswordshouldObscureText.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.appTextFadedColor,
                        ),
                      ),
                      validator: (value) =>
                          AppValidators.validatePassword(value),
                    ),
                  ),
                  const CustomHeight(height: 15),
                  Obx(
                    () => CustomTextFormField(
                      maxLines: 1,
                      controller: changePasswordCon.conPasswordCon,
                      labelText: "Confirm password",
                      obscureText: changePasswordCon
                          .confirmPasswordshouldObscureText.value,
                      suffixIcon: IconButton(
                        enableFeedback: false,
                        highlightColor: Colors.transparent,
                        onPressed:
                            changePasswordCon.shouldObscureConfirmPassword,
                        icon: Icon(
                          changePasswordCon
                                  .confirmPasswordshouldObscureText.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.appTextFadedColor,
                        ),
                      ),
                      validator: (value) =>
                          AppValidators.validateConfirmPassword(
                              value, changePasswordCon.nPasswordCon.text),
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight() * 0.2,
                  ),
                  CustomEleButton(
                    onPressed: changePasswordCon.savePassword,
                    text: "Save",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
