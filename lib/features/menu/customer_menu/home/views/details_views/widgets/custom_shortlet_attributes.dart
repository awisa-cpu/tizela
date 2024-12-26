import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shortlet_varied_attribute.dart';
import 'package:tizela/utils/constants/images_texts.dart';

import '../../../../../host_menu/listings/model/shorlet_model.dart';

class CustomShortletAttributes extends StatelessWidget {
  final ShortletModel shortlet;
  const CustomShortletAttributes({
    super.key,
    required this.shortlet,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shortlet.apartmentDetails.map(
        (attribute) {
          return CustomShortletVariedAttribute(
            attributeCount: attribute.detailCount.value,
            attributeName: attribute.name,
            imageIcon: _getAttributeIconByName(attribute.name),
          );
        },
      ).toList(),
    );
  }

  String _getAttributeIconByName(String name) {
    switch (name.toLowerCase()) {
      case "guests":
        return ImagesText.guestGreyIcon;
      case "bedroom":
        return ImagesText.bedroomIcon;
      case "bed":
        return ImagesText.bedIcon;
      case "bath":
        return ImagesText.bathIcon;
      default:
        return ImagesText.bedroomIcon;
    }
  }
}
