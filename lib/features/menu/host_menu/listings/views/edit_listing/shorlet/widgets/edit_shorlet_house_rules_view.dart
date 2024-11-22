import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../common/styles/custom_height.dart';
import '../../../../../../../../common/styles/custom_text_style.dart';
import '../../../new_listing/shorlet/widgets/custom_new_listing_shorlet_house_rules.dart';
import '../../widgets/custom_edit_view.dart';

class EditShorletHouseRulesView extends StatefulWidget {
  const EditShorletHouseRulesView({super.key});

  @override
  State<EditShorletHouseRulesView> createState() =>
      _EditShorletHouseRulesViewState();
}

class _EditShorletHouseRulesViewState extends State<EditShorletHouseRulesView> {
  bool petsAllowedFirstValue = false, petsAllowedSecondValue = false;
  bool smokingAllowedFirstValue = false, smokingAllowedSecondValue = false;
  bool partyAllowedFirstValue = false, partyAllowedSecondValue = false;
  @override
  Widget build(BuildContext context) {
    return CustomEditView(
      child: CustomColumn(
        children: [
          Text(
            "House rules",
            style: customTextStyle(fontSize: 16),
          ),
          const CustomHeight(),
          CustomNewListingShorletHouseRules(
            headerText: "Are pets allowed?",
            firstText: "Yes, they are.",
            secondText: "No, they not.",
            style: customTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            isFirstValueChecked: petsAllowedFirstValue,
            isSecondValueChecked: petsAllowedSecondValue,
            onFirstValueChanged: (newValue) {
              setState(() {
                petsAllowedFirstValue = true;
                if (petsAllowedFirstValue) {
                  petsAllowedSecondValue = false;
                }
              });
            },
            onSecondValueChanged: (value) {
              setState(() {
                petsAllowedSecondValue = true;
                if (petsAllowedSecondValue) {
                  petsAllowedFirstValue = false;
                }
              });
            },
          ),
          CustomNewListingShorletHouseRules(
            headerText: "Is smoking allowed?",
            firstText: "No, it is not.",
            secondText: "Yes, it is.",
            style: customTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            isFirstValueChecked: smokingAllowedFirstValue,
            isSecondValueChecked: smokingAllowedSecondValue,
            onFirstValueChanged: (newValue) {
              setState(() {
                smokingAllowedFirstValue = true;
                if (smokingAllowedFirstValue) {
                  smokingAllowedSecondValue = false;
                }
              });
            },
            onSecondValueChanged: (value) {
              setState(() {
                smokingAllowedSecondValue = true;
                if (smokingAllowedSecondValue) {
                  smokingAllowedFirstValue = false;
                }
              });
            },
          ),
          CustomNewListingShorletHouseRules(
            headerText: "Is partying allowed?",
            firstText: "No, it is not.",
            secondText: "Yes, it is.",
            style: customTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            isFirstValueChecked: partyAllowedFirstValue,
            isSecondValueChecked: partyAllowedSecondValue,
            onFirstValueChanged: (newValue) {
              setState(() {
                partyAllowedFirstValue = true;
                if (partyAllowedFirstValue) {
                  partyAllowedSecondValue = false;
                }
              });
            },
            onSecondValueChanged: (value) {
              setState(() {
                partyAllowedSecondValue = true;
                if (partyAllowedSecondValue) {
                  partyAllowedFirstValue = false;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
