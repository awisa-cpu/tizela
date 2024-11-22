import 'package:flutter/material.dart';
import 'package:tizela/data/local_database.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/more_custom_images_view.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/more_section_tab.dart';

import 'widgets/more_section_image_view.dart';

class MoreShortletImagesView extends StatelessWidget {
  const MoreShortletImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreCustomImagesView(
        headerText: "Photos-High Valley Villa",
        listItemCount: LocalDatabase.variedHouseSectionRooms.length,
        itemBuilder: (context, index) {
          final houseRoomItem = LocalDatabase.variedHouseSectionRooms[index];
          return MoreSectionTab(
            serviceModel: houseRoomItem,
            onTap: () {},
          );
        },
        gridItemCount: LocalDatabase.moreShorletImages.length,
        gridBuilder: (context, index) {
          final imageItem = LocalDatabase.moreShorletImages[index];

          return MoreSectionImageView(imageItem: imageItem);
        },
      ),
    );
  }
}
