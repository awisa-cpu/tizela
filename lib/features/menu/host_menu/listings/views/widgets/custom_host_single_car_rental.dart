import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/features/menu/host_menu/listings/views/widgets/custom_host_car_rental_details.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

import '../../model/car_rental_model.dart';

class CustomHostSingleCarRental extends StatelessWidget {
  final CarRentalModel carRental;
  const CustomHostSingleCarRental({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      padding: const EdgeInsets.only(bottom: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 13.5),
      showBorder: true,
      boxShadow: [
        BoxShadow(
          offset: const Offset(0.5, 1),
          color: Colors.grey.withOpacity(0.1),
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
                imageUrl: carRental.carImages.first,
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
                  imageIcon: ImagesText.galleryIcon,
                  text: carRental.carImages.length.toString(),
                  textStyle: const TextStyle(color: Colors.white),
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),

          //second section
          CustomHostCarRentalDetails(carRental: carRental,)
        ],
      ),
    );
  }
}
