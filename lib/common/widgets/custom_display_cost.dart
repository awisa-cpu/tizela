import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_span.dart';
import 'package:tizela/utils/constants/app_colors.dart';

import '../../utils/formatters/number_formatters.dart';

class CustomDisplayCost extends StatelessWidget {
  const CustomDisplayCost({
    super.key,
    required this.cost,
    required this.perWhat,
    this.costColor,
    this.perWhatColor,
    this.costFontWeight,
    this.costFontSize,
    this.perWhatFontWeight,
    this.perWhatFontSize,
    this.isSpaceBtwPerWhat = true,
  });

  final String cost, perWhat;
  final bool isSpaceBtwPerWhat;
  final Color? costColor, perWhatColor;
  final FontWeight? costFontWeight, perWhatFontWeight;
  final double? costFontSize, perWhatFontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          customTextSpan(
              text:
                  "#${AppNumberFormater.formatCurrency(amount: double.tryParse(cost) ?? 0.0)}",
              fontweight: costFontWeight ?? FontWeight.normal,
              color: costColor ?? AppColors.appMainColor,
              fontsize: costFontSize ?? 18),
          customTextSpan(
            text: isSpaceBtwPerWhat ? " / $perWhat" : " /$perWhat",
            fontweight: perWhatFontWeight ?? FontWeight.normal,
            color: perWhatColor ?? AppColors.appMainColor,
            fontsize: perWhatFontSize ?? 12,
          ),
        ],
      ),
    );
  }
}
