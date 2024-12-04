import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scroll_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_grid_selectable_service_types.dart';
import 'package:tizela/common/widgets/custom_header_sub_and_back_button.dart';
import 'package:tizela/common/widgets/custom_text_form_field.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_boat_cruise_controller.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/boat_cruise/widgets/custom_boat_type.dart';

import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';

class CustomNewListingBoatCruiseDescription extends StatelessWidget {
  const CustomNewListingBoatCruiseDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HostBoatCruiseController.instance;

    //
    return CustomScrollLayoutWidget(
      child: CustomColumn(
        children: [
          CustomHeaderSubAndBackButton(
            headerText: "Listing Description",
            subText:
                "Kindly share information about the boat you\n want to list",
            onTap: () {},
          ),

          //
          CustomGridSelectableServiceTypes(
            title: "Kindly select your Boat type",
            style: customTextStyle(),
            isThereSpaceAfterTitle: false,
            itemCount: controller.boatTypes.length,
            mainAxisExtent: 120,
            crossAxisSpacing: 25,
            itemBuilder: (context, index) {
              return Obx(() {
                final boatType = controller.boatTypes[index];

                final isBoatTypeSelected =
                    boatType == controller.selectedBoatType.value;
                return CustomBoatType(
                  boatType: boatType,
                  isBoatSelected: isBoatTypeSelected,
                  onTap: () => AppFunctions.onBoatTypeChanged(
                      boatType: boatType,
                      selectedBoatType: controller.selectedBoatType),
                );
              });
            },
          ),

          //
          Form(
            key: controller.boatdescriptionKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomColumn(
                    children: [
                      Text(
                        "Enter Boat name",
                        style: customTextStyle(),
                      ),
                      const CustomHeight(),
                      CustomTextFormField(
                        controller: controller.boatNameController,
                        hintText: "E.g Cruiser 12 (2004)",
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomColumn(
                    children: [
                      Text(
                        "Tell a story about the boat or the\n experience",
                        style: customTextStyle(),
                      ),

                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: CustomTextFormField(
                          controller: controller.boatStoryController,
                          maxLines: 5,
                          hintText: "Type here...",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
