import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomCardDisplayer extends StatelessWidget {
  final String cardName, size, uploadStatus;
  final VoidCallback onDelete, onCardTapped;
  final bool isCardTapped;
  const CustomCardDisplayer({
    super.key,
    required this.cardName,
    required this.size,
    required this.uploadStatus,
    required this.onDelete,
    required this.isCardTapped,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: CustomRoundedEdgedContainer(
        width: !isCardTapped ? context.screenWidth() : null,
        borderColor: AppColors.appMainColor,
        child: isCardTapped
            ? Row(
                children: [
                  Image.asset(ImagesText.fileUploadIcon),
                  const CustomWidth(width: 10),

                  //disply card details
                  Expanded(
                    child: CustomColumn(
                      children: [
                        //name of card.ext
                        Text(
                          cardName,
                          style: customTextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),

                        //size and upload status
                        Text(
                          "$size KB – $uploadStatus% uploaded",
                          style: customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF667085)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onDelete,
                    child: Text(
                      "Delete x",
                      style: customTextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImagesText.uploadIcon),
                  const CustomHeight(),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Click to upload", style: customTextStyle()),
                        const TextSpan(text: " or drag and drop"),
                      ],
                    ),
                  ),
                  const Text("SVG, PNG, JPG, or GIF (max. 800x400px)")
                ],
              ),
      ),
    );
  }
}
