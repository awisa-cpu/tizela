import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_grid_selectable_service_types.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/search_and_filter_views/widgets/custom_apartment_type.dart';
import 'package:tizela/features/menu/host_menu/listings/controllers/host_shorlet_controller.dart';
import '../../../../../../../../utils/validators/app_validators.dart';
import '../../../../../../../personalization/host_personalization/profile/views/widgets/custom_info_notification_with_text.dart';

class CustomNewListingShorletDescription extends StatelessWidget {
  const CustomNewListingShorletDescription({
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
            headerText: "Listing Description",
            subText:
                "Kindly share information about the apartment\n you want to list",
            onTap: () {},
          ),
          CustomGridSelectableServiceTypes(
            title: "Kindly select your apartment type",
            style: customTextStyle(),
            isThereSpaceAfterTitle: false,
            itemCount: controller.apartmentTypes.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final apartmentType = controller.apartmentTypes[index];

                final isApartmentSelected =
                    controller.selectedApartType.value == apartmentType;
                return CustomApartmentType(
                  apartmentType: apartmentType,
                  apartmentImageSelected: isApartmentSelected,
                  onTap: () => controller.updateSelectdApartType(
                    newSelectedApartment: apartmentType,
                  ),
                );
              });
            },
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomColumn(
              children: [
                Text(
                  "Enter apartment name",
                  style: customTextStyle(),
                ),
                const CustomHeight(height: 5),
                Form(
                  key: controller.apartmentDescFormKey,
                  child: CustomTextFormField(
                    controller: controller.apartmentNameCon,
                    hintText: "Apartment Name",
                    validator: (value) => AppValidators.validateTextField(
                      value,
                      fieldName: "Apartment",
                    ),
                  ),
                )
              ],
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomColumn(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Tell a story about the apartment host, or \n neighbourhood ",
                        style: customTextStyle(),
                      ),
                      TextSpan(
                        text: "(Optional)",
                        style: customTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: CustomTextFormField(
                    controller: controller.apartmentStoryCon,
                    maxLines: 5,
                    hintText: "Type here...",
                  ),
                ),

                //
                const CustomInfoNotificationWithText(
                  text:
                      "This description can include information about\n your hosting experience, property, and what sets\n you apart",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
