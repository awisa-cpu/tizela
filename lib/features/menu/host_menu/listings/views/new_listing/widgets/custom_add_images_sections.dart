import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/listings/views/new_listing/widgets/custom_add_image_button.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomAddImagesSections extends StatelessWidget {
  final String headerText;
  final int itemCount;
  final ItemBuilder itemBuilder;
  final VoidCallback onImageTapSelect;
  const CustomAddImagesSections({
    super.key,
    required this.headerText,
    required this.onImageTapSelect,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomColumn(
        children: [
          Text(
            headerText,
            style: customTextStyle(fontWeight: FontWeight.w600),
          ),
          itemCount > 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    height: 95,
                    child: CustomListview(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemCount,
                      itemBuilder: itemBuilder,
                    ),
                  ),
                )
              : const CustomHeight(),
          CustomAddImageButton(
            onImageSelect: onImageTapSelect,
          )
        ],
      ),
    );
  }
}
