import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_listview.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomTabs extends StatelessWidget {
  final ItemBuilder itemBuilder;
  final int itemCount;

  const CustomTabs({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    //
    return SizedBox(
      height: 45,
      child: CustomListview(
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
