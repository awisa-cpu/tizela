import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_height.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/common/widgets/custom_column.dart';
import 'package:tizela/common/widgets/custom_divider.dart';
import 'package:tizela/features/personalization/customer_personalization/profile/model/hep_center_faqs.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/build_context_extensions.dart';
import 'package:tizela/utils/constants/images_texts.dart';

class HelpCenterShorletFaqItem extends StatefulWidget {
  final HelpCenterFaqsModel shorletFaq;
  const HelpCenterShorletFaqItem({super.key, required this.shorletFaq});

  @override
  State<HelpCenterShorletFaqItem> createState() =>
      _HelpCenterShorletFaqItemState();
}

class _HelpCenterShorletFaqItemState extends State<HelpCenterShorletFaqItem> {
  //
  late bool isContainerHeightChanged;
  double containerHeight = 80;
  Alignment containerAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    isContainerHeightChanged = widget.shorletFaq.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: AppColors.appWhiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 2),
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 7,
                  blurRadius: 5,
                )
              ]),
          alignment: containerAlignment,
          duration: const Duration(microseconds: 300),
          width: context.screenWidth() * 0.80,
          height: containerHeight,
          child: SingleChildScrollView(
            child: CustomColumn(
              isMainAxisSize: false,
              children: [
                //first child
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.shorletFaq.title,
                      style: customTextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: _animateContainer,
                      child: Image.asset(
                        ImagesText.arrowDownIcon,
                      ),
                    )
                  ],
                ),

                if (containerHeight == 240)
                  CustomColumn(
                    isMainAxisSize: false,
                    children: [
                      const CustomHeight(height: 10),
                      const CustomDivider(),
                      const CustomHeight(height: 10),
                      Text(
                        widget.shorletFaq.body ?? '',
                        style: customTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: AppColors.appTextFadedColor,
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _animateContainer() {
    setState(
      () {
        isContainerHeightChanged = !isContainerHeightChanged;
        if (isContainerHeightChanged) {
          containerHeight = 240;
          containerAlignment = Alignment.topCenter;
        } else {
          containerHeight = 80;
          containerAlignment = Alignment.center;
        }
      },
    );
  }
}
