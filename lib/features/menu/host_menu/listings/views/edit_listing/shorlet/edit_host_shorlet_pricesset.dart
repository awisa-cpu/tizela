import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../common/widgets/widgets.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';
import '../widgets/edit_host_set_price_view.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';

class EditHostShorletPricesset extends StatefulWidget {
final ShortletModel shortlet;
  const EditHostShorletPricesset({super.key, required this.shortlet});

  @override
  State<EditHostShorletPricesset> createState() =>
      _EditHostShorletPricessetState();
}

class _EditHostShorletPricessetState extends State<EditHostShorletPricesset> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return EditHostSetupPrice(
      title: "Set Apartment Price",
      formWidget: Form(
        child: CustomColumn(
          children: [
            const CustomTextFormField(
              hintText: "#0.00",
            ),
            const CustomHeight(),
            const CustomInfoNotificationWithText(text: "Per night"),
            CustomColumn(
              children: [
                const CustomHeight(height: 20),
                Text(
                  "Set caution fee",
                  style: customTextStyle(),
                ),
                const CustomHeight(),
                const CustomTextFormField(
                  hintText: "#0.00",
                ),
                const CustomHeight(),
                const CustomInfoNotificationWithText(
                  text: "Refundable to customers after checkout",
                ),
                const CustomHeight(height: 20),
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
                          "Your earning per night after\n service charge",
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
                        height: context.screenHeight() * 0.30,
                      ),
                CustomEleButton(
                  onPressed: () {},
                  text: "Save",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
