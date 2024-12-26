import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/custom_dropdown_form.dart';

class CustomHostHomeStatFilterView extends StatelessWidget {
  final String title, dropdownvalue;
  final List<String> menuItems;
  final ValueChanged onItemChanged;
  const CustomHostHomeStatFilterView({
    super.key,
    required this.title,
    required this.dropdownvalue,
    required this.menuItems,
    required this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: customTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Expanded(
          child: CustomDropdownForm(
            currentValue: dropdownvalue,
            items: menuItems,
            onChanged: onItemChanged,
          ),
        )
      ],
    );
  }
}
