import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import '../../../common/styles/custom_text_span.dart';
import '../../../common/widgets/custom_ele_button.dart';
import '../controllers/user_onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(UserOnboardingController());
    final screenSize = MediaQuery.of(context).size;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        child: Column(
          children: [
            const CustomHeight(height: 100),
            //image
            Image.asset(ImagesText.companyBlueLogoName),

            const CustomHeight(height: 70),
            //
            Text(
              'Unlock Every Experience:',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  customTextSpan(
                    text: 'Stay, ',
                    color: AppColors.appMainColor,
                  ),
                  customTextSpan(text: 'Car rental, '),
                  customTextSpan(text: 'Boat cruise.'),
                ],
              ),
            ),
            const CustomHeight(height: 25),

            //carousel slider
            SizedBox(
              height: screenSize.height * 0.40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: [
                      Image.asset(
                        ImagesText.onboardingStay,
                      ),
                      Image.asset(
                        ImagesText.onboardingCar,
                      ),
                      Image.asset(
                        ImagesText.onboardingCruise,
                      ),
                    ],
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                    ),
                  ),
                  const CustomHeight(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const CustomWidth(width: 6),
                          ],
                        ),
                    ],
                  )
                ],
              ),
            ),
            const CustomHeight(height: 30),

            //button
            CustomEleButton(
              text: 'Begin',
              onPressed: onBoardingController.onOnboardingBeginTap,
            )
          ],
        ),
      ),
    );
  }
}
