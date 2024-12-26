import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_display_clip_image_with_size.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shorlet_model.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class CustomShorletBookingSummaryFirstSection extends StatelessWidget {
  const CustomShorletBookingSummaryFirstSection({
    super.key,
    required this.shortlet,
  });

  final ShortletModel shortlet;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 2),
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 7,
          blurRadius: 5,
        )
      ],
      paddingNumber: 15,
      borderRadius: 12,
      child: Row(
        children: [
          CustomDisplayClipImageWithSize(
            imageUrl: shortlet.apartmentImages.first,
          ),
          const CustomWidth(width: 10),
          CustomColumn(
            children: [
              //name
              Text(
                shortlet.apartmentName,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const CustomHeight(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(ImagesText.currentLocationIcon),
                  const CustomWidth(width: 5),
                  Text(
                    "Lagos Island",
                    style: customTextStyle(
                        fontSize: 12,
                        color: AppColors.appTextFadedColor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),

              const CustomHeight(height: 5),
              //cost
              CustomDisplayCost(cost: shortlet.apartmentPrice.toString(), perWhat: " hr"),
            ],
          )
        ],
      ),
    );
  }
}
