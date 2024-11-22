import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_or_remove_button.dart';

class CustomTextAndAddAndRemoveButtons extends StatelessWidget {
  final String text;
  final String? count;
  final TextStyle? style;
  final VoidCallback onAdd, onRemove;
  const CustomTextAndAddAndRemoveButtons({
    super.key,
    required this.text,
    this.count,
    required this.onAdd,
    required this.onRemove,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: style ?? customTextStyle(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAddOrRemoveButton(
                onTap: onRemove,
                actionIndicator: Icons.remove,
              ),
              const CustomWidth(
                width: 15,
              ),
              Text(
                count ?? "2",
                style: customTextStyle(),
              ),
              const CustomWidth(
                width: 15,
              ),
              CustomAddOrRemoveButton(
                onTap: onAdd,
                actionIndicator: Icons.add,
              ),
            ],
          )
        ],
      ),
    );
  }
}
