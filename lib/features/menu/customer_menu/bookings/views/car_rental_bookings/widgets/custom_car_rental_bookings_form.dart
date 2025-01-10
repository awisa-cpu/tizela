import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/host_menu/listings/model/car_rental_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../../../../../common/widgets/custom_rounded_container.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../controller/car_rental_booking_summary_controller.dart';

class CustomCarRentalBookingsForm extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomCarRentalBookingsForm({
    super.key,
    required this.carRental,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarRentalBookingSummaryController());

    //
    return Form(
      child: CustomColumn(
        children: [
          Text(
            "Pick-up time",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: GestureDetector(
              onTap: controller.selectTimeOfDay,
              child: CustomRoundedEdgedContainer(
                width: context.screenWidth(),
                height: 60,
                borderColor: Colors.grey.withValues(alpha: 0.5),
                child: Obx(() {
                  return Text(
                    controller.selectedTimeOfDay.value,
                    style: const TextStyle()
                        .copyWith(fontSize: 14, color: Colors.grey),
                  );
                }),
              ),
            ),
          ),

          //
          Text(
            "Booking duration",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Obx(
              () => CustomDropdownForm(
                currentValue: controller.selectedBookingDuration.value,
                items: LocalDatabase.durations,
                onChanged: (value) => AppFunctions.updateCheckboxStringValue(
                    newValue: value,
                    oldValue: controller.selectedBookingDuration),
              ),
            ),
          ),

          //
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.appMainColor,
                size: 18.33,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Cars must be booked for at least 12 hours.",
                  style: customTextStyle(
                      fontSize: 12,
                      color: AppColors.appTextFadedColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          const CustomHeight(height: 50),
          Text(
            "Enter Itinerary",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          
          
          //todo: address the focus scope and controller disposing
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: TextFormField(
              controller: controller.itenaryCon,
              decoration: const InputDecoration(hintText: "Type here..."),
              maxLines: 7,
             
            ),
          ),

          //
          CustomEleButton(
            onPressed: () => controller.proceedTocheckout(carRental: carRental),
            text: "Proceed",
          ),
        ],
      ),
    );
  }
}
