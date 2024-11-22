import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_outlined_button.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/common/widgets/custom_switch_button.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/change_password_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/help_center_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/privacy_policy_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_user_profile_list_tile.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../auth/controllers/user_sign_in_controller.dart';
import 'booking_type_setting_view.dart';
import 'id_verification_view.dart';
import 'payment_details_view.dart';

class HostProfileView extends StatelessWidget {
  const HostProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(UserSignInController());
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //header
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    ImagesText.bkImage,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 20.0,
                    child: Text(
                      "Profile setting",
                      style: customTextStyle(fontSize: 20),
                    ))
              ],
            ),

            //body
            CustomColumn(
              children: [
                CustomColumn(
                  children: [
                    CustomUserProfileListTile(
                      titleText: "Asuquo Godwin",
                      subText: "jellygrande@gmail.com",
                      trailing: Image.asset(
                        ImagesText.logoutIcon,
                      ),
                      onTap: () => _showLogoutSheet(
                        context,
                        authController,
                      ),
                    ),
                    const CustomDivider(),
                    CustomUserProfileListTile(
                      titleText: "Edit profile",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                      // onTap: () => AppNagivator.pushRoute(
                      //   context,
                      //   (_) => const EditUserProfileView(),
                      // ),
                    ),
                    const CustomDivider(),
                    CustomUserProfileListTile(
                      titleText: "Booking type setting",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        context,
                        (_) => const BookingTypeSettingView(),
                      ),
                    ),
                    const CustomDivider(),
                    CustomUserProfileListTile(
                      titleText: "Payment",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        context,
                        (_) => const PaymentDetailsView(),
                      ),
                    ),
                    const CustomDivider(),
                    CustomUserProfileListTile(
                      titleText: "Change password",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        context,
                        (_) => const ChangePasswordView(),
                      ),
                    ),
                    const CustomDivider(),
                    CustomUserProfileListTile(
                      titleText: "ID Verification",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        context,
                        (_) => const IdVerificationView(),
                      ),
                    ),
                  ],
                ),

                //

                CustomRoundedEdgedContainer(
                  color: AppColors.appIconColorBox,
                  showBorder: false,
                  borderRadius: 0.0,
                  child: CustomRoundedEdgedContainer(
                    child: Row(
                      children: [
                        CustomRoundedEdgedContainer(
                          color: AppColors.appIconColorBox,
                          showBorder: false,
                          alignment: Alignment.center,
                          child: Image.asset(ImagesText.userSquareIcon),
                        ),
                        const CustomWidth(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Switch to Customer acc.",
                                style: customTextStyle(fontSize: 18)),
                            const CustomHeight(height: 5),
                            Text(
                              "Find stays, rent a car and...",
                              style: customTextStyle(
                                color: AppColors.appTextFadedColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const CustomWidth(width: 25),
                        Expanded(
                          child: CustomSwitchButton(
                            value: false,
                            onValueChanged: (value){
                              
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //
                CustomScrollLayoutWidget(
                  child: CustomColumn(
                    children: [
                      CustomUserProfileListTile(
                        titleText: "Privacy policy",
                        onTap: () => AppNagivator.pushRoute(
                          context,
                          (_) => const PrivacyPolicyView(),
                        ),
                      ),
                      const CustomDivider(),
                      CustomUserProfileListTile(
                        titleText: "Help center",
                        onTap: () => AppNagivator.pushRoute(
                          context,
                          (_) => const HelpCenterView(),
                        ),
                      ),
                      const CustomDivider(),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutSheet(BuildContext context, UserSignInController controller) {
    showModalBottomSheet(
      backgroundColor: AppColors.appWhiteColor,
      isDismissible: false,
      context: context,
      builder: (context) {
        return CustomScrollLayoutWidget(
          padding: const EdgeInsets.only(
            bottom: 60,
            top: 13.5,
            left: 13.5,
            right: 13.5,
          ),
          child: CustomColumn(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Logout",
                    style: customTextStyle(
                        fontSize: 20, color: const Color(0xFFD31212)),
                  )
                ],
              ),
              const CustomHeight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure you want to log out?",
                    style: customTextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const CustomHeight(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                      actionText: "Cancel",
                      onTap: () => AppNagivator.goBack(context),
                    ),
                  ),
                  const CustomWidth(width: 15),
                  Expanded(
                    child: CustomEleButton(
                        onPressed: controller.logOutUser, text: "Yes, logout"),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
