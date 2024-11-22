import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../../utils/validators/app_validators.dart';
import '../../../../controllers/host_shorlet_controller.dart';

class CustomNewListingShorletLocation extends StatelessWidget {
  const CustomNewListingShorletLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Location",
            subText:
                "Your address is only shared with guests after \nthey've made a reservation.",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Form(
              key: controller.addressDescFormKey,
              child: CustomColumn(
                children: [
                  CustomTextFormField(
                    controller: controller.addressCon,
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    hintText: "Enter Address",
                    validator: (address) => AppValidators.validateTextField(
                        address,
                        fieldName: "Address"),
                  ),
                  const CustomHeight()
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.my_location_outlined,
                size: 15,
              ),
              const CustomWidth(width: 7),
              Text(
                "Use current location",
                style: customTextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          CustomHeight(
            height: context.screenHeight() * 0.50,
          ),
        ],
      ),
    );
  }
}

class CustomNewListingLocationAddressConfirmation extends StatelessWidget {
  const CustomNewListingLocationAddressConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Kindly confirm address",
            subText:
                "Your address is only shared with guests after \nthey've made a reservation.",
            onTap: () {},
          ),
          CustomRoundedEdgedContainer(
            borderRadius: 10.0,
            borderColor: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.symmetric(vertical: 26),
            child: CustomColumn(
              children: [
                const CustomTextAndDivider(
                  dividerText: "Address",
                  addressText: "No 23 Kosoko road, Ojudu Berger.",
                ),
                const CustomTextAndDivider(
                  dividerText: "Local gov.t",
                  addressText: "Ojudu",
                ),
                const CustomTextAndDivider(
                  dividerText: "State",
                  addressText: "Lagos",
                ),
                const CustomTextAndDivider(
                  dividerText: "Post code",
                  addressText: "124689",
                ),
                const CustomHeight(),
                Align(
                  alignment: Alignment.center,
                  child: CustomOutlinedButton(
                    style: OutlinedButton.styleFrom(
                      enableFeedback: false,
                      side: const BorderSide(color: AppColors.appMainColor),
                    ),
                    width: context.screenWidth() * 0.24,
                    actionText: "Edit",
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagesText.blueEditPen,
                        ),
                        const CustomWidth(width: 5),
                        Text(
                          "Edit",
                          style: customTextStyle(color: AppColors.appMainColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomColumn(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    customTextSpan(text: "Add flat no, floor..."),
                    customTextSpan(
                      text: "(if applicable)",
                      fontweight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              const CustomHeight(),
              const CustomTextFormField(
                hintText: "Add Flat no, floor, bldg (if applicable)",
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomTextAndDivider extends StatelessWidget {
  final String dividerText;
  final String addressText;
  const CustomTextAndDivider({
    super.key,
    required this.dividerText,
    required this.addressText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.5),
      child: CustomColumn(
        children: [
          Row(
            children: [
              Text(
                dividerText,
                style: customTextStyle(
                  color: AppColors.appTextFadedColor,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const CustomWidth(width: 5),
              const Expanded(
                child: CustomDivider(),
              )
            ],
          ),
          const CustomHeight(),
          Text(
            addressText,
            style: customTextStyle(
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
