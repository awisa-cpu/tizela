import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../common/widgets/custom_rounded_container.dart';
import '../../../../../setup/app_navigator.dart';
import '../../../../auth/models/app_user.dart';
import '../controller/customer_profile_controller.dart';

class EditCustomerProfileView extends StatelessWidget {
  final AppUser currentAppUser;
  const EditCustomerProfileView({super.key, required this.currentAppUser});

  @override
  Widget build(BuildContext context) {
    final CustomerProfileController userProfileCon =
        CustomerProfileController.instance;

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          isMainAxisSize: false,
          children: [
            //
            CustomColumn(
              children: [
                CustomHeaderSubAndBackButton(
                  headerText: "Profile details",
                  subText: "kindly edit your profile details.",
                  onTap: () {
                    AppNagivator.goBack();
                    userProfileCon.resetResources();
                  },
                ),
                //
                const CustomHeight(height: 30),
                Form(
                  key: userProfileCon.userEditFormKey,
                  child: CustomColumn(
                    children: [
                      CustomTextFormField(
                        hintText: currentAppUser.lastName,
                        controller: userProfileCon.lNameCon,
                      ),
                      const CustomHeight(height: 15),
                      CustomTextFormField(
                        hintText: currentAppUser.firstName,
                        controller: userProfileCon.fNameCon,
                      ),
                      const CustomHeight(height: 15),
                      CustomTextFormField(
                        hintText: currentAppUser.emailAddress,
                        controller: userProfileCon.emailCon,
                      ),
                      const CustomHeight(height: 15),
                      GestureDetector(
                        onTap: userProfileCon.selectDate,
                        child: CustomRoundedEdgedContainer(
                          width: context.screenWidth(),
                          height: 60,
                          borderColor: Colors.grey.withValues(alpha: 0.5),
                          child: Obx(() {
                            return Text(
                              userProfileCon.selectedUserDob.value,
                              style: const TextStyle()
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            );
                          }),
                        ),
                      ),
                      const CustomHeight(
                        height: 25.5,
                      ),
                      CustomEleButton(
                        onPressed: userProfileCon.editUserProfile,
                        text: "Save",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
