import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/model/destination_model.dart';

class CustomSeeMoreItemDestination extends StatelessWidget {
  const CustomSeeMoreItemDestination({
    super.key,
    required this.destinationItem,
  });

  final DestinationModel destinationItem;
//todo : adjust the design
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        destinationItem.imageUrl,
        height: 190,
        width: 140,
        fit: BoxFit.contain,
      ),
    );
  }
}
