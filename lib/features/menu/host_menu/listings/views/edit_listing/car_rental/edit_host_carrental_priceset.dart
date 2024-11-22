import 'package:flutter/material.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../common/styles/styles.dart';
import '../../../../../../../common/widgets/widgets.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../../../model/car_rental_model.dart';
import '../widgets/edit_host_set_price_view.dart';

class EditHostCarrentalPriceset extends StatefulWidget {
  final CarRentalModel carRental;
  const EditHostCarrentalPriceset({super.key, required this.carRental});

  @override
  State<EditHostCarrentalPriceset> createState() =>
      _EditHostCarrentalPricesetState();
}

class _EditHostCarrentalPricesetState extends State<EditHostCarrentalPriceset> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return EditHostSetupPrice(
      title: "Set car rental price",
      formWidget: Form(
        child: CustomColumn(
          children: [
            const CustomTextFormField(
              hintText: "#0.00",
            ),
            const CustomHeight(),
            const CustomInfoNotificationWithText(text: "for 12 hours"),
            const CustomHeight(height: 15),
            CustomCheckboxWithText(
              isChecked: isTermsAccepted,
              isCheckBoxFirst: true,
              isSpaceBetween: false,
              activeColor: Colors.green,
              text: "I accept Tizela service charge of 12.5%",
              onValueChanged: (value) {
                setState(() {
                  if (value != null) {
                    isTermsAccepted = value;
                  }
                });
              },
            ),
            if (isTermsAccepted)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomDivider(
                      opacityLevel: 0.1,
                      thickness: 3,
                    ),
                    const CustomHeight(height: 15),
                    Text(
                      "Your earning per hour after\n service charge",
                      style: customTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    const CustomHeight(),
                    CustomRoundedEdgedContainer(
                      width: context.screenWidth() * 0.4,
                      height: 100,
                      borderColor: AppColors.appMainColor,
                      alignment: Alignment.center,
                      borderRadius: 20,
                      borderWidth: 2.0,
                      child: Text(
                        "#56,000",
                        style: customTextStyle(
                          fontSize: 26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            isTermsAccepted
                ? const CustomHeight()
                : CustomHeight(
                    height: context.screenHeight() * 0.45,
                  ),
            CustomEleButton(
              onPressed: () {},
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
