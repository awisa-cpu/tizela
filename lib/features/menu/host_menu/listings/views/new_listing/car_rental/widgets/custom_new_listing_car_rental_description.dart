import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';
import 'package:tizela/common/widgets/custom_grid_selectable_service_types.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_car_type.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/car_rental/widgets/custom_single_car_brand.dart';

import '../../../../controllers/host_car_rental_controller.dart';

class CustomNewListingCarRentalDescription extends StatelessWidget {
  const CustomNewListingCarRentalDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final HostCarRentalController controller = HostCarRentalController.instance;

    //
    return CustomScrollLayoutWidget(
      child: Form(
        child: CustomColumn(
          children: [
            CustomHeaderSubAndBackButton(
              headerText: "Listing Description",
              subText:
                  "Kindly share information about the car you want \n to list",
              onTap: () {},
            ),

            //
            CustomGridSelectableServiceTypes(
              title: "Kindly select your car type",
              style: customTextStyle(),
              isThereSpaceAfterTitle: false,
              itemCount: controller.carTypes.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  final carType = controller.carTypes.elementAt(index);
                  bool isCarTypeSelected =
                      carType == controller.selectedCarType.value;

                  return CustomCarType(
                    carType: carType,
                    isCarTypeSelected: isCarTypeSelected,
                    onTap: () => controller.onUpdateCarTypeSelected(carType),
                  );
                });
              },
            ),

            //
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomColumn(
                children: [
                  Text(
                    "Select car brand",
                    style: customTextStyle(),
                  ),
                  const CustomHeight(height: 5),
                  SizedBox(
                    height: 65,
                    child: CustomListview(
                      scrollDirection: Axis.horizontal,
                      seperatedBuilderWidth: 20,
                      itemCount: controller.carModels.length,
                      itemBuilder: (_, index) {
                        return Obx(
                          () {
                            final brand = controller.carModels[index];

                            final isSelected = brand.imageUrl ==
                                controller.selectedCarBrand.value.imageUrl;

                            return CustomSingleCarBrand(
                              brand: brand,
                              isSelected: isSelected,
                              onTap: () =>
                                  controller.onUpdateCarBrandSelected(brand),
                            );
                          },
                        );
                      },
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
                  Text(
                    "Enter Car year",
                    style: customTextStyle(),
                  ),

                  //
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Obx(
                      () => CustomDropdownForm(
                        currentValue: controller.currentCarYear.value,
                        items: LocalDatabase.carYears,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            controller.onCarYearChanged(newValue);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
