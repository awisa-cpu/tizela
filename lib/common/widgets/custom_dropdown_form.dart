import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';

class CustomDropdownForm extends StatelessWidget {
  final String currentValue;
  final List<String> items;
  final ValueChanged onChanged;
  const CustomDropdownForm({
    super.key,
    required this.currentValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          enableFeedback: false,
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
