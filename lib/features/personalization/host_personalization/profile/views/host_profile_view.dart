import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/common/widgets/custom_switch_button.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/change_password_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/help_center_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/privacy_policy_view.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/views/widgets/custom_user_profile_list_tile.dart';
import 'package:tizela/setup/app_navigator.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../utils/shimmers/app_custom_shimmer.dart';
import '../../../../auth/controllers/user_sign_in_controller.dart';
import '../controller/host_profile_controller.dart';
import 'booking_type_setting_view.dart';
import 'edit_host_profile_view.dart';
import 'id_verification_view.dart';
import 'payment_details_view.dart';

class HostProfileView extends StatelessWidget {
  const HostProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(UserSignInController());
    final hostProfileController = HostProfileController.instance;

    //
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //header
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
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
                  ),
                )
              ],
            ),

            //body
            CustomColumn(
              children: [
                CustomColumn(
                  children: [
                    //
                    Obx(
                      () {
                        return hostProfileController.isUserStillLoading.value
                            ? const AppCustomShimmerEffect(
                                height: 50,
                                width: double.infinity,
                              )
                            : CustomUserProfileListTile(
                                titleText: hostProfileController
                                    .currentAppUser.value.userFullName,
                                subText: hostProfileController
                                    .currentAppUser.value.emailAddress,
                                trailing: Image.asset(
                                  ImagesText.logoutIcon,
                                ),
                                onTap: () =>
                                    AppFunctions.showAppLogoutModalBottomSheet(
                                  controller: authController,
                                ),
                              );
                      },
                    ),
                    const CustomDivider(),

                    //profile
                    CustomUserProfileListTile(
                      titleText: "Edit profile",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        EditHostProfileView(
                          currentAppUser:
                              hostProfileController.currentAppUser.value,
                        ),
                      ),
                    ),
                    const CustomDivider(),

                    //booking
                    CustomUserProfileListTile(
                      titleText: "Booking type setting",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        const BookingTypeSettingView(),
                      ),
                    ),
                    const CustomDivider(),

                    //payment
                    CustomUserProfileListTile(
                      titleText: "Payment",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        const PaymentDetailsView(),
                      ),
                    ),
                    const CustomDivider(),

                    //password
                    CustomUserProfileListTile(
                      titleText: "Change password",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        const ChangePasswordView(),
                      ),
                    ),
                    const CustomDivider(),

                    //Id verification
                    CustomUserProfileListTile(
                      titleText: "ID Verification",
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => AppNagivator.pushRoute(
                        const IdVerificationView(),
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
                        //
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
                            onValueChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //
                CustomScrollableLayoutWidget(
                  child: CustomColumn(
                    children: [
                      CustomUserProfileListTile(
                        titleText: "Privacy policy",
                        onTap: () => AppNagivator.pushRoute(
                          const PrivacyPolicyView(),
                        ),
                      ),
                      const CustomDivider(),
                      CustomUserProfileListTile(
                        titleText: "Help center",
                        onTap: () => AppNagivator.pushRoute(
                          const HelpCenterView(),
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
}
