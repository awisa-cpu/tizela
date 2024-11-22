import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import '../../../../../menu/host_menu/listings/controllers/host_shorlet_controller.dart';
import 'custom_card_displayer.dart';

class CustomIdCardUploadDetails extends StatelessWidget {
  const CustomIdCardUploadDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hostShorletCon = HostShorletController.instance;
    return CustomColumn(
      children: [
        Text(
          "Front of the card",
          style: customTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const CustomHeight(height: 20),
        Obx(
          () => CustomCardDisplayer(
            cardName: hostShorletCon.idFrontPage.value.name ?? '',
            size: hostShorletCon.idFrontPage.value.size ?? '',
            uploadStatus: "100",
            isCardTapped:
                hostShorletCon.idFrontPage.value.name != null ? true : false,
            onDelete: () {},
            onCardTapped: () =>
                hostShorletCon.selectIdCardType(id: hostShorletCon.idFrontPage),
          ),
        ),

        //
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            "Back of the card",
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),

        Obx(
          () => CustomCardDisplayer(
            cardName: hostShorletCon.idBackPage.value.name ?? '',
            size: hostShorletCon.idBackPage.value.size ?? '',
            uploadStatus: "100",
            isCardTapped:
                hostShorletCon.idBackPage.value.name != null ? true : false,
            onDelete: () {},
            onCardTapped: () =>
                hostShorletCon.selectIdCardType(id: hostShorletCon.idBackPage),
          ),
        ),
      ],
    );
  }
}
