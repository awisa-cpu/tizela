import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../controllers/host_car_rental_controller.dart';

class CustomNewListingCarRentalCreationRules extends StatelessWidget {
  const CustomNewListingCarRentalCreationRules({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController controller = HostCarRentalController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Car Rules",
            subText: "Kindly share details about the car you want to \n list.",
            onTap: () {},
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: CustomColumn(
              children: [
                Text(
                  "Car Policies",
                  style: customTextStyle(
                    fontSize: 16,
                  ),
                ),
                CustomListview(
                  itemCount: controller.carPolicies.length,
                  itemBuilder: (context, index) {
                    final carRule = controller.carPolicies[index];
                    return Obx(() {
                      return CustomCheckboxWithText(
                        text: carRule.name,
                        isChecked: carRule.isActive.value,
                        onValueChanged: (value) =>
                            controller.onCarRenCheckBoxChanged(
                          newValue: value,
                          feature: carRule,
                        ),
                      );
                    });
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
                      "Driver services",
                      style: customTextStyle(
                        fontSize: 16,
                      ),
                    ),
                    CustomListview(
                      itemCount: controller.driverPolicies.length,
                      itemBuilder: (context, index) {
                        final carRule = controller.driverPolicies[index];
                        return Obx(() {
                          return CustomCheckboxWithText(
                            text: carRule.name,
                            isChecked: carRule.isActive.value,
                            onValueChanged: (value) =>
                                controller.onCarRenCheckBoxChanged(
                              newValue: value,
                              feature: carRule,
                            ),
                          );
                        });
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
