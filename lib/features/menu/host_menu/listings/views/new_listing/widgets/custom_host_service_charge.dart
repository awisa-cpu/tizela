import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomHostServiceCharge extends StatelessWidget {
  final bool isTermsAccepted;
  final String earningsAfterServiceCharge;
  const CustomHostServiceCharge({
    super.key,
    required this.earningsAfterServiceCharge,
    required this.isTermsAccepted,
  });


  @override
  Widget build(BuildContext context) {
    return isTermsAccepted
        ? Padding(
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
                    "#$earningsAfterServiceCharge",
                    style: customTextStyle(
                      fontSize: 26,
                    ),
                  ),
                )
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
