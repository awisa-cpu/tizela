import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../../../../../../personalization/host_personalization/profile/views/widgets/custom_id_card_upload_details.dart';
import '../../../../controllers/host_shorlet_controller.dart';
import '../../../../model/id_type_model.dart';

class CustomNewListingShorletVerification extends StatelessWidget {
  const CustomNewListingShorletVerification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HostShorletController.instance;

    //
    return CustomScrollableLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Verification",
            subText: "Kindly choose and upload valid ID.",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: CustomColumn(
              children: [
                Text(
                  "Choose ID type",
                  style: customTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const CustomHeight(height: 15),
                Text(
                  "Kindly choose and upload your valid ID",
                  textAlign: TextAlign.start,
                  style: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor,
                  ),
                ),
                CustomListview(
                  isPaddingNeeded: false,
                  itemCount: controller.availableIdTypes.length,
                  itemBuilder: (_, index) {
                    final id = controller.availableIdTypes[index];

                    return Obx(() => CustomCheckboxWithText(
                          text: getIdName(idType: id.type),
                          isChecked: id.isActive.value,
                          isShapeDifferent: true,
                          onValueChanged: (_) =>
                              controller.updateSelectedIdChanged(
                            itemIndex: index,
                          ),
                        ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Upload Identification Card",
                    style: customTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const CustomIdCardUploadDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getIdName({required IdType idType}) {
    switch (idType) {
      case IdType.interpassport:
        return "International passport";

      case IdType.nationalid:
        return "National ID";

      case IdType.driverlicense:
        return "Driver's license";

      case IdType.nin:
        return "National Identity Number (NIN)";

      case IdType.voterscard:
        return "Voters card";

      default:
        return "id card";
    }
  }
}
