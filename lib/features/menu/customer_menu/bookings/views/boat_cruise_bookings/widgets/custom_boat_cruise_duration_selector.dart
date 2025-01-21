import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../../controller/boat_cruise_bookings_controller.dart';

class CustomBoatCruiseDurationSelector extends StatelessWidget {
  const CustomBoatCruiseDurationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BoatCruiseBookingsController.instance;
    return CustomColumn(children: [
      Text(
        "Select cruise duration",
        style: customTextStyle(fontSize: 16),
      ),
      const CustomHeight(height: 10),
      Row(
        spacing: 20,
        children: [
          Expanded(
            child: CustomColumn(
              children: [
                Text(
                  "Start time",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: controller.selectStartTime,
                  child: CustomRoundedEdgedContainer(
                    width: context.screenWidth(),
                    height: 60,
                    borderColor: Colors.grey.withValues(alpha: 0.5),
                    child: Obx(() {
                      return Text(
                        controller.selectedStartTimeOfDay.value,
                        style: const TextStyle()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomColumn(
              children: [
                Text(
                  "End  time",
                  style: customTextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: controller.selectEndTime,
                  child: CustomRoundedEdgedContainer(
                    width: context.screenWidth(),
                    height: 60,
                    borderColor: Colors.grey.withValues(alpha: 0.5),
                    child: Obx(() {
                      return Text(
                        controller.selectedEndTimeOfDay.value,
                        style: const TextStyle()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
