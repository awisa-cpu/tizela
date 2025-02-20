import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomDropdownForm extends StatelessWidget {
  final String currentValue;
  final List<String> items;
  final ValueChanged onChanged;
  final double? menuMaxHeight;
  final AlignmentGeometry alignment;
  final Color? dropdownColor;
  final bool isExpanded;
  final int elevation;
  const CustomDropdownForm({
    super.key,
    required this.currentValue,
    required this.items,
    required this.onChanged,
    this.menuMaxHeight,
    this.alignment = AlignmentDirectional.centerStart,
    this.dropdownColor,
    this.isExpanded = true,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          menuMaxHeight: menuMaxHeight,
          alignment: alignment,
          dropdownColor: dropdownColor,
          isExpanded: isExpanded,
          enableFeedback: false,
          elevation: elevation ,
          hint: Text(currentValue),
          items: items
              .map((time) => DropdownMenuItem(value: time, child: Text(time)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
