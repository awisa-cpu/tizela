import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/host_menu/home/views/widgets/custom_host_header_text_with_action_button.dart';
import 'package:tizela/utils/constants/images_texts.dart';
import 'package:tizela/utils/typdefes/custom_type_defs.dart';

class CustomDataViewWidget extends StatelessWidget {
  final int totalItemCount;
  final VoidCallback onSearchTap;
  final ItemBuilder itemBuilder;

  const CustomDataViewWidget({
    super.key,
    required this.totalItemCount,
    required this.onSearchTap,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHostHeaderTextWithActionButton(
          title: "Listings",
          count: totalItemCount.toString(),
          onTap: onSearchTap,
          child: Image.asset(ImagesText.searchIcon),
        ),
        CustomListview(
          itemCount: totalItemCount,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
