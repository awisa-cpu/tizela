import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/utils/device/app_functions.dart/app_functions.dart';

class CustomNewListingBoatCruseRules extends StatelessWidget {
  const CustomNewListingBoatCruseRules({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Boat Rules",
            subText: "Kindly share details about the boat you want to \n list.",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: CustomColumn(
              children: [
                Text(
                  "Boat Policies",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: controller.boatPolicies.length,
                  itemBuilder: (context, index) {
                    final boatPolicy = controller.boatPolicies[index];
                    return Obx(
                      () {
                        return CustomCheckboxWithText(
                          text: boatPolicy.name,
                          isChecked: boatPolicy.isActive.value,
                          onValueChanged: (value) =>
                              AppFunctions.updateCheckboxValue(
                            newValue: value,
                            oldValue: boatPolicy.isActive,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),

            //
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: CustomColumn(
              children: [
                const CustomDivider(),
                const CustomHeight(height: 13.5),
                CustomColumn(
                  children: [
                    Text(
                      "Sailors services",
                      style: customTextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CustomListview(
                      itemCount: controller.boatSailorPolicies.length,
                      itemBuilder: (context, index) {
                        final boatSailorPolicy =
                            controller.boatSailorPolicies[index];
                        return Obx(
                          () {
                            return CustomCheckboxWithText(
                              text: boatSailorPolicy.name,
                              isChecked: boatSailorPolicy.isActive.value,
                              onValueChanged: (value) =>
                                  AppFunctions.updateCheckboxValue(
                                newValue: value,
                                oldValue: boatSailorPolicy.isActive,
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
