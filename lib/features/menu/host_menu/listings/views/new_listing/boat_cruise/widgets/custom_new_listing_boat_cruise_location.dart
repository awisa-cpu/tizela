import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../../common/styles/custom_height.dart';
import '../../../../../../../../common/styles/custom_scroll_layout_widget.dart';
import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../../../../../../common/styles/custom_width.dart';
import '../../../../../../../../utils/validators/app_validators.dart';

class CustomNewListingBoatCruiseLocation extends StatelessWidget {
  const CustomNewListingBoatCruiseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;
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
              key: controller.boatAddressKey,
              child: CustomColumn(
                children: [
                  CustomTextFormField(
                    controller: controller.boatAddressController,
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
