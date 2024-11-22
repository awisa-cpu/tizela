import 'package:flutter/material.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/model/car_rental_model_xxxxx.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/more_custom_images_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/more_section_tab.dart';

import 'widgets/more_section_image_view.dart';

class MoreCarRentalImagesView extends StatelessWidget {
  final CarRentalModelxxxxxxxxxxx carRental;
  const MoreCarRentalImagesView({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreCustomImagesView(
        headerText: carRental.name,
        listItemCount: LocalDatabase.variedCarSections.length,
        gridItemCount: LocalDatabase.moreCarRentalImages.length,
        itemBuilder: (_, index) {
          final carRentalItem = LocalDatabase.variedCarSections[index];

          return MoreSectionTab(
            serviceModel: carRentalItem,
            onTap: () {},
          );
        },
        gridBuilder: (_, index) {
          final carTypeImageItem = LocalDatabase.moreCarRentalImages[index];
          return MoreSectionImageView(
            imageItem: carTypeImageItem,
          );
        },
      ),
    );
  }
}
