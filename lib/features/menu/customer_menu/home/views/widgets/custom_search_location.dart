import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_scrollable_layout_widget.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_ele_button.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';

class CustomSearchLocation extends StatelessWidget {
  final String locationText, controllerText, eleButtonText;
  final VoidCallback onEleButtonPressed;
  const CustomSearchLocation({
    super.key,
    required this.locationText,
    required this.controllerText,
    required this.eleButtonText,
    required this.onEleButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollableLayoutWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            locationText,
            style: customTextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const CustomHeight(height: 10),
          TextFormField(
            decoration: InputDecoration(
                hintText: controllerText,
                hintStyle: customTextStyle(
                    fontSize: 14,
                    color: AppColors.appTextFadedColor,
                    fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: context.screenHeight() * 0.60,
          ),
          CustomEleButton(onPressed: onEleButtonPressed, text: eleButtonText)
        ],
      ),
    );
  }
}
