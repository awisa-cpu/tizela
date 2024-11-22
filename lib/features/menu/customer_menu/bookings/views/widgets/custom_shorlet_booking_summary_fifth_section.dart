import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/styles/custom_width.dart';
import 'package:tizela/common/widgets/custom_checkbox_with_text.dart';
import 'package:tizela/features/menu/customer_menu/home/views/details_views/widgets/custom_shortlet_attributes.dart';

class CustomShorletBookingSummaryFifthSection extends StatelessWidget {
  const CustomShorletBookingSummaryFifthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Who is checking in?",
            style: customTextStyle(
              fontSize: 16,
            ),
          ),
          const CustomHeight(height: 15),
          const CustomShortletAttributes(),
          const CustomHeight(height: 15),
          Row(
            children: [
              CustomCheckboxWithText(
                text: "Myself",
                isChecked: true,
                isSpaceBetween: false,
              ),
              const CustomWidth(width: 10),
              CustomCheckboxWithText(
                text: "Someone else",
                isChecked: true,
                isSpaceBetween: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
