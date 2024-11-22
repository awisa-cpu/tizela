import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/auth/views/sign_in/widgets/auth_header_texts.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:get/get.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../common/widgets/custom_text_form_field.dart';
import '../../../../utils/validators/app_validators.dart';
import '../../controllers/user_sign_up_controller.dart';

class UserSignUpView extends StatelessWidget {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCon = Get.put(UserSignUpController());

    //
    return Scaffold(
      body: CustomScrollLayoutWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthHeaderTexts(
              mainText: "Add your details",
              subText1: "Make sure the information shared matches",
              subText2: "the details in your valid ID",
              onPressedBackButton: () => AppNagivator.goBack(context),
            ),
            const CustomHeight(height: 30),
            Form(
              key: signUpCon.signUpFormKey,
              child: Column(
                children: [
                  //
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: signUpCon.fNameCon,
                          labelText: "First name",
                          validator: (value) => AppValidators.validateTextInput(
                            value: value,
                            fieldName: "First Name",
                          ),
                        ),
                      ),
                      const CustomWidth(width: 15),
                      Expanded(
                        child: CustomTextFormField(
                          controller: signUpCon.lNameCon,
                          labelText: "Last name",
                          validator: (value) => AppValidators.validateTextInput(
                            value: value,
                            fieldName: "Last Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const CustomHeight(height: 20),
                  GestureDetector(
                    onTap: signUpCon.selectDate,
                    child: CustomRoundedEdgedContainer(
                      width: context.screenWidth(),
                      height: 60,
                      borderColor: Colors.grey.withOpacity(0.5),
                      child: Obx(
                        () => Text(
                          signUpCon.selectedDobString.value,
                          style: const TextStyle()
                              .copyWith(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const CustomHeight(height: 20),
                  CustomTextFormField(
                    controller: signUpCon.phoneCon,
                    labelText: "Phone number",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => CustomCheckboxWithText(
                          isSpaceBetween: false,
                          isCheckBoxFirst: false,
                          text: "Customer",
                          isChecked: signUpCon.isCustomer.value,
                          onValueChanged: signUpCon.onCustomerValueChanged,
                        ),
                      ),
                      Obx(
                        () => CustomCheckboxWithText(
                          isSpaceBetween: false,
                          isCheckBoxFirst: false,
                          text: "Host",
                          isChecked: signUpCon.isHost.value,
                          onValueChanged: signUpCon.onHostValueChanged,
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: signUpCon.emailCon,
                    labelText: "Email",
                    validator: (email) => AppValidators.validateEmail(email),
                  ),
                  const CustomHeight(height: 20),
                  CustomTextFormField(
                    controller: signUpCon.passwordCon,
                    labelText: "Password",
                    validator: (password) =>
                        AppValidators.validatePassword(password),
                  ),
                  const CustomHeight(height: 35),
                  CustomEleButton(
                    onPressed: signUpCon.signUpUser,
                    text: "Submit",
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
