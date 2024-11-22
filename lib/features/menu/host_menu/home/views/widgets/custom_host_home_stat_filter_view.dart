import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomHostHomeStatFilterView extends StatelessWidget {
  final String title, dropdownvalue;
  final List<String> menuItems;
  final OnValueChanged onItemChanged;
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
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.appTextFadedColor))),
            enableFeedback: false,
            isExpanded: false,
            elevation: 2,
            value: dropdownvalue,
            items: [...menuItems]
                .map((filter) =>
                    DropdownMenuItem(value: filter, child: Text(filter)))
                .toList(),
            onChanged: onItemChanged,
          ),
        )
      ],
    );
  }
}
