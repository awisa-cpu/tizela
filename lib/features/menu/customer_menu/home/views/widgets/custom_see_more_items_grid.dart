import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/model/destination_model.dart';
import 'package:tizela/features/menu/customer_menu/home/model/holiday_service_model.dart';

import 'custom_see_more_item.dart';
import 'custom_see_more_item_destination.dart';

class CustomSeeMoreItemsGrid extends StatelessWidget {
  const CustomSeeMoreItemsGrid({
    super.key,
    required this.serviceType,
  });

  final List serviceType;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: serviceType.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        // mainAxisExtent: 150,
      ),
      itemBuilder: (_, index) {
        final serviceItem = serviceType[index];
        if (serviceItem is ServiceTypeModel) {
          return CustomSeeMoreItem(serviceItem: serviceItem);
        }

        if (serviceItem is DestinationModel) {
          return CustomSeeMoreItemDestination(
            destinationItem: serviceItem,
          );
        }

        return null;
      },
    );
  }
}
