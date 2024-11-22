import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:get/get.dart';
import '../../../../../utils/validators/app_validators.dart';
import '../../../../onboarding/views/widgets/custom_social_media_button.dart';
import '../../../controllers/user_sign_in_check_controller.dart';
import 'custom_seperated_divider.dart';

class UserSignInCheckForm extends StatelessWidget {
  const UserSignInCheckForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userCheckCon = Get.put(UserSigninCheckController());
    return Form(
      key: userCheckCon.userSignInCheckKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: userCheckCon.userSignInCheckController,
            validator: (email) => AppValidators.validateEmail(email),
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const CustomHeight(height: 20),

          //
          CustomEleButton(
            onPressed: userCheckCon.userCheck,
            text: 'Continue',
          ),
          const CustomHeight(height: 40),
          const CustomSeperatedDivider(),
          const CustomHeight(height: 25),
          CustomSocialMediaButton(
            imageIcon: ImagesText.googleIcon,
            linkText: 'Continue with Google',
            onTap: () {},
          ),
          CustomSocialMediaButton(
            imageIcon: ImagesText.appleIcon,
            linkText: 'Continue with Apple',
            onTap: () {},
          ),
          CustomSocialMediaButton(
            imageIcon: ImagesText.facebookIcon,
            linkText: 'Continue with Facebook',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
