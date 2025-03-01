import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_center_text_button.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';

import '../../../../../common/widgets/custom_listview.dart';
import '../controller/id_verification_controller.dart';
import 'widgets/custom_id_card_upload_details.dart';

class IdVerificationView extends StatelessWidget {
  const IdVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final idVerificationController = Get.put(IdVerificationController());

    //
    return Scaffold(
      body: CustomScrollableLayoutWidget(
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

            //id types
            CustomColumn(
              children: [
                Text(
                  "Choose ID type",
                  style: customTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomHeight(height: 15),
                CustomListview(
                  isPaddingNeeded: false,
                  itemCount: idVerificationController.availableIdTypes.length,
                  itemBuilder: (_, index) {
                    final id = idVerificationController.availableIdTypes[index];

                    return Obx(
                      () => CustomCheckboxWithText(
                        text:
                            idVerificationController.getIdName(idType: id.type),
                        isChecked: id.isActive.value,
                        isShapeDifferent: true,
                        onValueChanged: (_) =>
                            idVerificationController.updateSelectedIdChanged(
                          itemIndex: index,
                        ),
                      ),
                    );
                  },
                ),
              ],
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
            CustomEleButton(
                onPressed: idVerificationController.onSubmit, text: "Submit"),
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
