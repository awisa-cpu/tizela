import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/edit_host_shortlet_controller.dart';

import '../../../../../../../../common/styles/custom_height.dart';
import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../model/shorlet_model.dart';
import '../../../new_listing/shorlet/widgets/custom_new_listing_shorlet_house_rules.dart';
import '../../widgets/custom_edit_view.dart';

class EditShorletHouseRulesView extends StatelessWidget {
  final ShortletModel shortlet;
  const EditShorletHouseRulesView({super.key, required this.shortlet});

  @override
  Widget build(BuildContext context) {
    final controller = EditHostShortletController.instance;
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "House rules",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(),
          CustomListview(
            itemCount: shortlet.houseRules.length,
            itemBuilder: (_, index) {
              final houseRule = shortlet.houseRules[index];

              return Obx(
                () => CustomNewListingShorletHouseRules(
                  headerText: "${houseRule.name}?",
                  firstText: "${houseRule.yesText}.",
                  secondText: "${houseRule.noText}.",
                  isFirstValueChecked: houseRule.isFirstValue.value,
                  isSecondValueChecked: houseRule.isSecondValue.value,
                  onFirstValueChanged: (_) =>
                      AppFunctions.onFirstHouseRuleChanged(
                          houseRule: houseRule),
                  onSecondValueChanged: (_) =>
                      AppFunctions.onSecondHouseRuleChanged(
                          houseRule: houseRule),
                ),
              );
            },
          ),
          const CustomHeight(),
          Obx(
            () => CustomEleButton(
              onPressed: () =>
                  controller.updateShortletHouseRules(shortlet: shortlet),
              text: controller.isShorletHouseRulesUpdating.value
                  ? "Updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
