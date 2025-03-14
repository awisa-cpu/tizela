import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/auth/models/app_user.dart';
import 'package:tizela/features/personalization/host_personalization/profile/controller/host_profile_controller.dart';

import '../../../../../common/widgets/widgets.dart';
import '../../../../../setup/setup.dart';
import '../../../../../utils/validators/app_validators.dart';

class EditHostProfileView extends StatelessWidget {
  final AppUser currentAppUser;
  const EditHostProfileView({super.key, required this.currentAppUser});

  @override
  Widget build(BuildContext context) {
    final hostProfileCon = HostProfileController.instance;

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
              spacing: 30,
              children: [
                CustomHeaderSubAndBackButton(
                  headerText: "Profile details",
                  subText: "kindly edit your profile details.",
                  onTap: () {
                    AppNagivator.goBack();
                    hostProfileCon.resetResources();
                  },
                ),
                //
              

                //
                CustomColumn(
                  children: [
                    CustomTextFormField(
                      hintText: currentAppUser.lastName,
                      controller: hostProfileCon.lNameCon,
                    ),
                    const CustomHeight(height: 15),
                    CustomTextFormField(
                      hintText: currentAppUser.firstName,
                      controller: hostProfileCon.fNameCon,
                    ),
                    const CustomHeight(height: 15),
                    CustomTextFormField(
                      hintText: currentAppUser.phoneNumber.isEmpty
                          ? "08104201466"
                          : currentAppUser.phoneNumber,
                      controller: hostProfileCon.phoneNumberCon,
                    ),
                    const CustomHeight(height: 15),
                    Form(
                      key: hostProfileCon.hostEditEmailFormKey,
                      child: CustomTextFormField(
                        hintText: currentAppUser.emailAddress,
                        controller: hostProfileCon.emailCon,
                        validator: (value) => AppValidators.validateEmail(value),
                      ),
                    ),
                    const CustomHeight(
                      height: 25.5,
                    ),
                    CustomEleButton(
                      onPressed: hostProfileCon.editHostProfile,
                      text: "Save",
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
