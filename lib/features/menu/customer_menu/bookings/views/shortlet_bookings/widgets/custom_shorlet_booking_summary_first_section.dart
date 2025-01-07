import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_display_cost.dart';
import 'package:tizela/common/widgets/custom_network_image.dart';
import 'package:tizela/common/widgets/custom_rounded_container.dart';
import 'package:tizela/features/menu/host_menu/listings/model/shortlet_model.dart';
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
          CustomCachedNetworkImage(
            networkImageUrl: shortlet.apartmentImages.first,
          ),
          const CustomWidth(width: 10),
          CustomColumn(
            spacing: 5,
            children: [
              //name
              Text(
                shortlet.apartmentName,
                style: customTextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(ImagesText.currentLocationIcon),
                  const CustomWidth(width: 5),
                  Text(
                    "${shortlet.address.state} Island",
                    style: customTextStyle(
                        fontSize: 12,
                        color: AppColors.appTextFadedColor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),

              //cost
              CustomDisplayCost(
                cost: shortlet.apartmentPrice.toString(),
                perWhat: " hr",
                costFontWeight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
