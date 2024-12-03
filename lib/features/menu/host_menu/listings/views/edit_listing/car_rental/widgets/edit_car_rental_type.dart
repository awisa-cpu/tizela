import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';

import '../../../../../../../../common/widgets/custom_dropdown_form.dart';
import '../../../../../../../../common/widgets/custom_grid_selectable_service_types.dart';
import '../../../../../../../../data/local_database.dart';
import '../../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../controllers/edit_host_car_rental_controller.dart';
import '../../../../model/car_rental_model.dart';
import '../../../new_listing/car_rental/widgets/custom_car_type.dart';
import '../../../new_listing/car_rental/widgets/custom_single_car_brand.dart';
import '../../widgets/custom_edit_view.dart';

class EditCarRentalType extends StatelessWidget {
  final CarRentalModel carRental;
  const EditCarRentalType({
    super.key,
    required this.carRental,
  });

  @override
  Widget build(BuildContext context) {
    final controller = EditHostCarRentalController.instance;

    //
    return CustomEditView(
      child: CustomColumn(
        children: [
          CustomGridSelectableServiceTypes(
            title: "Kindly select your car type",
            titleSpacing: 60,
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
                  onTap: () => AppFunctions.onUpdateCarTypeSelected(
                    carType: carType,
                    selectedCarType: controller.selectedCarType,
                  ),
                );
              });
            },
          ),

          //car brand
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

                          final isSelected =
                              brand == controller.selectedCarBrand.value;

                          return CustomSingleCarBrand(
                            brand: brand,
                            isSelected: isSelected,
                            onTap: () => AppFunctions.onUpdateCarBrandSelected(
                              carBrand: brand,
                              selectedCarBrand: controller.selectedCarBrand,
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),

          //car year
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
                      currentValue: controller.selectedCarYear.value,
                      items: LocalDatabase.carYears,
                      onChanged: (newValue) => AppFunctions.onCarYearChanged(
                        newValue: newValue,
                        currentCarYear: controller.selectedCarYear,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Obx(
            () => CustomEleButton(
              onPressed: () => controller.updateCarRentalTypeAndModelDetails(
                currentCarRental: carRental,
              ),
              text: controller.isCarRentalTypeAndDetailsUpdating.value
                  ? "updating in progress..."
                  : "Save",
            ),
          )
        ],
      ),
    );
  }
}
