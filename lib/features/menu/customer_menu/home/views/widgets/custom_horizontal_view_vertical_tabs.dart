import 'package:flutter/material.dart';
import 'package:tizela/features/menu/customer_menu/home/model/destination_model.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/single_destination_package.dart';

class CustomHorizontalViewVerticalTabs extends StatelessWidget {
  final List<DestinationModel> destinationData;
  const CustomHorizontalViewVerticalTabs(
      {super.key, required this.destinationData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        itemCount: destinationData.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final destinationItem = destinationData[index];
          return SingleDestinationPackage(destinationItem: destinationItem);
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 15,
        ),
      ),
    );
  }
}
