import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/listings/model/boat_cruise_model.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_boat_cruise_details.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomHostSingleBoatCruise extends StatelessWidget {
  final BoatCruiseModel boatCruise;
  const CustomHostSingleBoatCruise({super.key, required this.boatCruise});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      padding: const EdgeInsets.only(bottom: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 13.5),
      showBorder: true,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.5, 1),
          color: Colors.grey.withValues(alpha: 0.1),
          blurRadius: 4,
          spreadRadius: 5,
        )
      ],
      child: CustomColumn(
        children: [
          //first section
          Stack(
            children: [
              CustomDisplayClipImageWithSize(
                imageUrl: boatCruise.boatImages.first,
                isNetworkImage: true,
                height: 270,
                width: context.screenWidth(),
                borderRadi: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: CustomIconAndText(
                  text: boatCruise.boatImages.length.toString(),
                ),
              )
            ],
          ),

          //second section
          CustomHostBoatCruiseDetails(
            boatCruise: boatCruise,
          )
        ],
      ),
    );
  }
}
