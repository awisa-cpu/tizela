import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shortlet_varied_attribute.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomShortletAttributes extends StatelessWidget {
  const CustomShortletAttributes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        CustomShortletVariedAttribute(
          attributeCount: 2,
          attributeName: "guests",
          imageIcon: ImagesText.guestGreyIcon,
        ),
        SizedBox(width: 5),
        CustomShortletVariedAttribute(
          attributeCount: 1,
          attributeName: "bedroom",
          imageIcon: ImagesText.bedroomIcon,
        ),
        SizedBox(width: 5),
        CustomShortletVariedAttribute(
          attributeCount: 1,
          attributeName: "bed",
          imageIcon: ImagesText.bedIcon,
        ),
        SizedBox(width: 5),
        CustomShortletVariedAttribute(
          attributeCount: 1,
          attributeName: "bath",
          imageIcon: ImagesText.bathIcon,
        ),
      ],
    );
  }
}
