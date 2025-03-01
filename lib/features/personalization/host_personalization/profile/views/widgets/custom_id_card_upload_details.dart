import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import '../../controller/id_verification_controller.dart';
import 'custom_card_displayer.dart';

class CustomIdCardUploadDetails extends StatelessWidget {
  const CustomIdCardUploadDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final idVerificationController = IdVerificationController.instance;

    //
    return CustomColumn(
      children: [
        Text(
          "Front of the card",
          style: customTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const CustomHeight(height: 20),

        //
        Obx(
          () => CustomCardDisplayer(
            cardName: idVerificationController.idFrontPage.value.name ?? '',
            size: idVerificationController.idFrontPage.value.size ?? '',
            uploadStatus: "100",
            isCardTapped:
                idVerificationController.idFrontPage.value.name != null ? true : false,
            onDelete: () {},
            onCardTapped: () =>
                idVerificationController.selectIdCardType(id: idVerificationController.idFrontPage),
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
            cardName: idVerificationController.idBackPage.value.name ?? '',
            size: idVerificationController.idBackPage.value.size ?? '',
            uploadStatus: "100",
            isCardTapped:
                idVerificationController.idBackPage.value.name != null ? true : false,
            onDelete: () {},
            onCardTapped: () =>
                idVerificationController.selectIdCardType(id: idVerificationController.idBackPage),
          ),
        ),
      ],
    );
  }
}
