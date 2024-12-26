import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/features/onboarding/controllers/user_onboarding_controller.dart';
import 'package:tizela/features/onboarding/views/widgets/custom_account_type_button.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:get/get.dart';

import '../../auth/views/sign_in/user_signin_check_view.dart';

class UserAccountTypeView extends StatelessWidget {
  const UserAccountTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(UserOnboardingController());

    //
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              ImagesText.onboardingBkImage,
              fit: BoxFit.contain,
            ),
          ),
          const CustomHeight(height: 50),
          Padding(
            padding: const EdgeInsets.all(13.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your account type',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CustomHeight(height: 10),
                Text(
                  'Are you continuing as a host or a customer?',
                  style: customTextStyle(
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const CustomHeight(height: 50),
                Obx(
                  () => CustomAccountTypeButton(
                    mainText: 'Host',
                    subText: 'List, manage and get paid.',
                    icon: ImagesText.userSquareIcon,
                    isTapped: onBoardingController.isHostTapped.value,
                    borderWidth: onBoardingController.hostBorderWidth.value,
                    borderColor: onBoardingController.hostBorderColor,
                    onTap: onBoardingController.onHostValueChanged,
                  ),
                ),
                const CustomHeight(height: 30),
                Obx(
                  () => CustomAccountTypeButton(
                    mainText: 'Customer',
                    subText: 'Find stays, rent a car and enjoy cruise.',
                    icon: ImagesText.userIcon,
                    isTapped: onBoardingController.isCustomerTapped.value,
                    borderWidth: onBoardingController.customerBorderWidth.value,
                    borderColor: onBoardingController.customerBorderColor,
                    onTap: onBoardingController.onCustomerValueChanged,
                  ),
                ),
                const CustomHeight(height: 100),
                CustomEleButton(
                  onPressed: () {
                    if (onBoardingController.isHostTapped.value) {
                      AppNagivator.pushRoute(
                       const UserSignInCheckView(),
                      );
                    } else if (onBoardingController.isCustomerTapped.value) {
                      AppNagivator.pushNamedRoute(
                          customerAuthTypeRoute);
                    }
                  },
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
