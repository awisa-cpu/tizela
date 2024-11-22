import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_center_text_button.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';

import 'widgets/custom_id_card_upload_details.dart';

class IdVerificationView extends StatelessWidget {
  const IdVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollLayoutWidget(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight,
          horizontal: 13.5,
        ),
        child: CustomColumn(
          children: [
            const CustomHeaderSubAndBackButton(
              headerText: "Identity card verification",
              isthereSubText: false,
            ),
            const CustomHeight(height: 30),
            Text(
              "Choose ID type",
              style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomHeight(height: 15),
            CustomCheckboxWithText(
              text: "International passport",
              isChecked: false,
              isShapeDifferent: true,
            ),
            CustomCheckboxWithText(
              text: "National ID",
              isChecked: false,
              isShapeDifferent: true,
            ),
            CustomCheckboxWithText(
              text: "Driver’s license",
              isChecked: false,
              isShapeDifferent: true,
            ),
            CustomCheckboxWithText(
              text: "National identity Number (NIN)",
              isChecked: false,
              isShapeDifferent: true,
            ),
            CustomCheckboxWithText(
              text: "Voters card",
              isChecked: false,
              isShapeDifferent: true,
            ),
            const CustomHeight(height: 15),
            Text(
              "Upload Identification Card",
              style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomHeight(height: 15),
            const CustomIdCardUploadDetails(),
            const CustomHeight(height: 30),
            CustomEleButton(onPressed: () {}, text: "Submit"),
            const CustomHeight(height: 20),
            CustomCenterTextButton(
              actionText: "Save & exit",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
