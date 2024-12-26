import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../setup/app_navigator.dart';
import 'widgets/custom_social_media_button.dart';

//only customer navigates here
class CustomerAuthenticationTypeView extends StatelessWidget {
  const CustomerAuthenticationTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 13.5,
          ),
          child: Column(
            children: [
              const CustomHeight(height: 25),
              Image.asset(ImagesText.companyBlueLogoName),
              const CustomHeight(height: 30),
              Text(
                'Unlock Every Experience:',
                style: customTextStyle(
                  color: AppColors.appTextFadedColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const CustomHeight(height: 10),
              Text(
                'Stay, Car rental, Cruise and Events.',
                style: customTextStyle(fontSize: 18),
              ),
              const CustomHeight(height: 35),
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

              CustomSocialMediaButton(
                imageIcon: ImagesText.messageIcon,
                linkText: 'Continue with Email',
                onTap: () =>
                  AppNagivator.pushNamedRoute( userSignInRoute),
                
              ),

              const CustomHeight(height: 35),
              const CustomHeight(height: 35),

              //action
              TextButton(
                onPressed: () {},
                child: Text(
                  'Continue without login',
                  style: customTextStyle(
                    color: AppColors.appMainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
